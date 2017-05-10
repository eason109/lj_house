# encoding:utf-8

import pymysql
import config
import requests
from bs4 import BeautifulSoup

conn = pymysql.connect(host=config.db_host, port=3306, user=config.db_user,
                       passwd=config.db_passwd, db='lj_crawling', use_unicode=True, charset='utf8')
cur = conn.cursor()
cur.execute("SELECT * FROM lj_area WHERE 1 = 1")
results = cur.fetchall()

# 每次运行前删除旧数据
cur.execute("DELETE FROM lj_street WHERE 1 = 1")
try:
    for row in results:
        area_code = row[0]
        newUrl = config.base_url + "ershoufang/" + area_code
        res = requests.get(newUrl).text
        bsObj = BeautifulSoup(res, "html.parser")
        streets = bsObj.find("div", {"data-role": "ershoufang"}).findAll("div")[1].findAll("a")

        for street in streets:
            href = street.attrs["href"]
            if href:
                streetName = street.get_text()
                streetCode = href.split("/")[2]
                insertStreet = "INSERT INTO lj_street(area_code,street_code,street_name)" \
                               "VALUES ('%s','%s','%s')" \
                               % (area_code, streetCode, streetName)
                cur.execute(insertStreet)
            else:
                continue
            conn.commit()
finally:
    cur.close()
    conn.close()
