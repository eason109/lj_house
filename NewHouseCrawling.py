# coding:utf-8
import config
import requests
import HeadersConfig
from bs4 import BeautifulSoup
import json
import time
import re
import pymysql
import MailSender

streetCode = config.street_code
areaCode = config.area_code
code = ""
if streetCode:
    code = streetCode
else:
    code = areaCode

reqUrl = config.base_url + "ershoufang/" + code + "/co32"
res = requests.get(reqUrl, headers=HeadersConfig.headers).text
bsObj = BeautifulSoup(res, "html.parser")
at = bsObj.find("div", {"class": "page-box house-lst-page-box"})
page = bsObj.find("div", {"class": "page-box house-lst-page-box"}).attrs["page-data"]
pageCount = 1
if page:
    pageJson = json.loads(page)
    pageCount = pageJson["totalPage"]

conn = pymysql.connect(host=config.db_host, port=3306, user=config.db_user,
                       passwd=config.db_passwd, db='lj_crawling', use_unicode=True, charset='utf8')
cur = conn.cursor()

for i in range(pageCount):
    reqUrl = config.base_url + "ershoufang/" + code + "/pg" + str(i) + "co32/"
    res = requests.get(reqUrl, headers=HeadersConfig.headers).text
    bsObj = BeautifulSoup(res, "html.parser")
    houses = bsObj.find("ul", {"class": "sellListContent"}).findAll("li")
    if houses:
        minPrice = config.min_price
        maxPrice = config.max_price
        for house in houses:
            refUrl = house.find("a").attrs["href"]
            subUrl = refUrl.split("/")[-1]
            houseId = subUrl.split(".")[0]
            infos = house.select("div > div")
            title = infos[0].text
            info = infos[1].text.split("|")
            village = info[0].strip()
            area = info[2].replace("平米", "").strip()
            toward = info[3].strip()
            price = infos[5].select(".totalPrice")[0].text
            price = price.replace("万", "")
            year = infos[2].select(".positionInfo")[0].text
            unitPriceInfo = infos[5].select(".unitPrice")[0].text
            unitPrice = re.findall(r"\d+\.?\d*", unitPriceInfo)[0]
            querySql = "select count(1) from lj_house where house_id =  '%s'" % houseId
            cur.execute(querySql)
            result = cur.fetchall()
            count = result[0][0]
            if count == 0:
                if minPrice <= float(price) <= maxPrice:
                    send_mail = MailSender.SendEmail("yichen_deng@163.com", "470868299@qq.com", "房源信息",
                                                     "标题：" + title + "\n" + "小区：" + village + "\n"
                                                     + "面积：" + area + "\n"
                                                     + "朝向：" + toward + "\n"
                                                     + "总价：" + price + "\n"
                                                     + "单价：" + unitPrice + "\n"
                                                     + "地址：" + refUrl)
                    send_mail.send()
                else:
                    print("当前房屋价钱：" + price)
            else:
                print("没有新房源")
                break
            insertStreet = "INSERT INTO lj_house(house_id,title,village,price,year_flood,area,toward,unit_price,ref_url,street_code)" \
                           "VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')" \
                           % (houseId, title, village, price, year, area, toward, unitPrice, refUrl, streetCode)
            try:
                cur.execute(insertStreet)
                conn.commit()
            except Exception as e:
                print(e)
    else:
        print("未找到房源")
    time.sleep(120)
cur.close()
