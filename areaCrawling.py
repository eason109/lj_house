# coding:utf-8

from urllib.request import urlopen
from bs4 import BeautifulSoup
import config
import pymysql

areaHtml = urlopen(config.base_url + "ershoufang/")
bsObj = BeautifulSoup(areaHtml, "html.parser", from_encoding="utf-8")
areas = bsObj.find("div", {"data-role": "ershoufang"}).findAll("a")

conn = pymysql.connect(host='192.168.226.129', port=3306, user='eason',
                       passwd='Eason109!@#', db='lj_crawling', use_unicode=True, charset="utf8")
cur = conn.cursor()
cur.execute("DELETE FROM lj_area WHERE 1 = 1")

try:
    for area in areas:
        href = area.attrs["href"]
        if href:
            areaName = area.get_text()
            areaCode = href.split("/")[2]
            print(areaCode + "===>" + areaName)
            insertArea = "INSERT INTO lj_area(area_code,area_name) " \
                         "VALUES ('%s','%s')" \
                         % (areaCode, area.get_text())
            cur.execute(insertArea)
        else:
            continue
        conn.commit()
finally:
    cur.close()
    conn.close()
