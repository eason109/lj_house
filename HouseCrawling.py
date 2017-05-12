# coding:utf-8

import pymysql
import config
import requests
import re
import time
import json
from bs4 import BeautifulSoup

conn = pymysql.connect(host=config.db_host, port=3306, user=config.db_user,
                       passwd=config.db_passwd, db='lj_crawling', use_unicode=True, charset='utf8')
cur = conn.cursor()
cur.execute("SELECT * FROM lj_street WHERE 1 = 1")
areaResult = cur.fetchall()

cur.execute("DELETE FROM lj_house WHERE 1 = 1")

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
    'Accept': 'text/html;q=0.9,*/*;q=0.8',
    'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
    'Accept-Encoding': 'gzip',
    'Connection': 'close',
    'Referer': None  # 注意如果依然不能抓取的话，这里可以设置抓取网站的host
}

for row in areaResult:
    streetCode = row[1]
    reqUrl = config.base_url + "ershoufang/" + streetCode
    res = requests.get(reqUrl, headers=headers).text
    bsObj = BeautifulSoup(res, "html.parser")
    at = bsObj.find("div", {"class": "page-box house-lst-page-box"})
    page = bsObj.find("div", {"class": "page-box house-lst-page-box"}).attrs["page-data"]
    pageCount = 1;
    if page:
        pageJson = json.loads(page)
        pageCount = pageJson["totalPage"]
    for i in range(pageCount):
        reqUrl = reqUrl + "/pg" + str(i) + "/"
        res = requests.get(reqUrl, headers=headers).text
        bsObj = BeautifulSoup(res, "html.parser")
        houses = bsObj.find("ul", {"class": "sellListContent"}).findAll("li")
        if houses:
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
                year = infos[2].select(".positionInfo")[0].text
                unitPriceInfo = infos[5].select(".unitPrice")[0].text
                unitPrice = re.findall(r"\d+\.?\d*", unitPriceInfo)[0]
                insertStreet = "INSERT INTO lj_house(house_id,title,village,price,year_flood,area,toward,unit_price,ref_url,street_code)" \
                               "VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')" \
                               % (houseId, title, village, price, year, area, toward, unitPrice, refUrl, streetCode)
                try:
                    cur.execute(insertStreet)
                except Exception as e:
                    print(e)
        else:
            continue
        time.sleep(60)
