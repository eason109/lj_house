-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 192.168.3.119    Database: lj_crawling
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lj_street`
--

DROP TABLE IF EXISTS `lj_street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lj_street` (
  `area_code` varchar(64) NOT NULL,
  `street_code` varchar(64) NOT NULL,
  `street_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`area_code`,`street_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='街道信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lj_street`
--

LOCK TABLES `lj_street` WRITE;
/*!40000 ALTER TABLE `lj_street` DISABLE KEYS */;
INSERT INTO `lj_street` VALUES ('tianhe','changxing1','长兴'),('tianhe','chebei','车陂'),('tianhe','cencun','岑村'),('tianhe','dongpu','东圃'),('tianhe','dongzhan','东站'),('tianhe','dongguanzhuang','东莞庄'),('tianhe','gaotang','高唐'),('tianhe','huijingxincheng','汇景新城'),('tianhe','huangcun','黄村'),('tianhe','huajingxincheng','华景新城'),('tianhe','longkoudong','龙口东'),('tianhe','longkouxi','龙口西'),('tianhe','longdong','龙洞'),('tianhe','shuiyin','水荫'),('tianhe','shipai1','石牌'),('tianhe','shahe1','沙河'),('tianhe','shatainan','沙太南'),('tianhe','shataibei','沙太北'),('tianhe','tianhegongyuan','天河公园'),('tianhe','tianhebei','天河北'),('tianhe','tangxia1','棠下'),('tianhe','tianrunlu','天润路'),('tianhe','tiyuzhongxin','体育中心'),('tianhe','tianhenan','天河南'),('tianhe','wushan','五山'),('tianhe','yuancun','员村'),('tianhe','yueken','粤垦'),('tianhe','zhujiangxinchengdong','珠江新城东'),('tianhe','zhujiangxinchengxi','珠江新城西'),('tianhe','zhujiangxinchengzhong','珠江新城中'),('yuexiu','beijinglu','北京路'),('yuexiu','dongfengxi','东风西'),('yuexiu','dongfengdong','东风东'),('yuexiu','donghu1','东湖'),('yuexiu','dongchuanlu','东川路'),('yuexiu','dongshankou','东山口'),('yuexiu','ershadao','二沙岛'),('yuexiu','guihuagang','桂花岗'),('yuexiu','huanshidong','环市东'),('yuexiu','haizhuguangchang','海珠广场'),('yuexiu','huanghuagang','黄花岗'),('yuexiu','jichanglu','机场路'),('yuexiu','jiefangbei','解放北'),('yuexiu','jianshelu1','建设路'),('yuexiu','jiefangnan','解放南'),('yuexiu','lujing','麓景'),('yuexiu','liuhuazhanqian','流花站前'),('yuexiu','nongjiangsuo','农讲所'),('yuexiu','panfu','盘福'),('yuexiu','renminlu','人民路'),('yuexiu','renminbei1','人民北'),('yuexiu','sanyuanli','三元里'),('yuexiu','shuiyin','水荫'),('yuexiu','shahe1','沙河'),('yuexiu','taojin','淘金'),('yuexiu','wuyangxincheng','五羊新城'),('yuexiu','xiaobei','小北'),('yuexiu','ximenkou','西门口'),('yuexiu','xihualu','西华路'),('yuexiu','yangji','杨箕'),('yuexiu','yuexiunan','越秀南'),('liwan','chenjiaci','陈家祠'),('liwan','chajiao','茶滘'),('liwan','datansha','大坦沙'),('liwan','dongfengxi','东风西'),('liwan','donglang','东塱'),('liwan','fenshui','汾水'),('liwan','fangcundadao','芳村大道'),('liwan','huangsha','黄沙'),('liwan','hedong1','鹤洞'),('liwan','huadidadao','花地大道'),('liwan','jiaokou1','滘口'),('liwan','kengkou','坑口'),('liwan','longxi1','龙溪'),('liwan','liuhuazhanqian','流花站前'),('liwan','liwanlu','荔湾路'),('liwan','nananlu','南岸路'),('liwan','renminlu','人民路'),('liwan','renminbei1','人民北'),('liwan','xichang','西场'),('liwan','xiguan','西关'),('liwan','xicun','西村'),('liwan','xihualu','西华路'),('liwan','zhongshanba1','中山八'),('haizhu','baogang','宝岗'),('haizhu','binjiangzhong','滨江中'),('haizhu','binjiangxi','滨江西'),('haizhu','binjiangdong','滨江东'),('haizhu','chigang','赤岗'),('haizhu','changgang1','昌岗'),('haizhu','dongxiaolu','东晓路'),('haizhu','dongxiaonan','东晓南'),('haizhu','gongyedadaozhong','工业大道中'),('haizhu','guangzhoudadaonan','广州大道南'),('haizhu','guanzhou','官洲'),('haizhu','gongyedadaonan','工业大道南'),('haizhu','gongyedadaobei','工业大道北'),('haizhu','jiangnandadao','江南大道'),('haizhu','jiangnanxi','江南西'),('haizhu','jiangyanlu','江燕路'),('haizhu','jinbi','金碧'),('haizhu','nanzhou','南洲'),('haizhu','pazhou','琶洲'),('haizhu','qianjinlu','前进路'),('haizhu','tongfu','同福'),('haizhu','xingangxi','新港西'),('panyu','dashi','大石'),('panyu','daxuecheng','大学城'),('panyu','huanan1','华南'),('panyu','luoxi','洛溪'),('panyu','nanpu','南浦'),('panyu','qifu','祈福'),('panyu','shilouzhen','石楼镇'),('panyu','shawan1','沙湾'),('panyu','shiqiao1','市桥'),('panyu','shiji1','石基'),('panyu','xinzao','新造'),('panyu','yayundadaozhong','亚运大道中'),('panyu','yayuncheng','亚运城'),('panyu','zhongcun','钟村'),('baiyun','baiyundadaonan','白云大道南'),('baiyun','baiyundadaobei','白云大道北'),('baiyun','conghua1','从化'),('baiyun','dajinzhong','大金钟'),('baiyun','guangyuanlu','广园路'),('baiyun','guihuagang','桂花岗'),('baiyun','huangshilu','黄石路'),('baiyun','jinshazhou','金沙洲'),('baiyun','jichanglu','机场路'),('baiyun','jianggaozhen','江高镇'),('baiyun','luochongwei','罗冲围'),('baiyun','nanhu5','南湖'),('baiyun','renhe1','人和'),('baiyun','shijing','石井'),('baiyun','sanyuanli','三元里'),('baiyun','shenshanzhen','神山镇'),('baiyun','shatainan','沙太南'),('baiyun','shahe1','沙河'),('baiyun','tongdewei','同德围'),('baiyun','tonghe1','同和'),('baiyun','xinshi','新市'),('baiyun','zhongluotan','钟落谭'),('huangpugz','changzhoudao1','长洲岛'),('huangpugz','kaifaqu3','开发区'),('huangpugz','kexuecheng','科学城'),('huangpugz','qufu','区府'),('conghua','conghua1','从化'),('conghua','liuxihebandao','流溪河半岛'),('conghua','wenquanzhen','温泉镇'),('zengcheng','donghugongyuan','东湖公园'),('zengcheng','fuhezhen','福和镇'),('zengcheng','licheng1','荔城'),('zengcheng','sanjiangzhen','三江镇'),('zengcheng','shitanzhen','石滩镇'),('zengcheng','xiancunzhen','仙村镇'),('zengcheng','xintang','新塘'),('zengcheng','xiaolouzhen','小楼镇'),('zengcheng','xiangling','象岭'),('zengcheng','yonghe1','永和'),('zengcheng','zengjiang','增江'),('zengcheng','zhengguozhen','正果镇'),('zengcheng','zhongxinzhen','中新镇'),('huadou','beixingzhen','北兴镇'),('huadou','chinizhen','赤坭镇'),('huadou','furongzhen','芙蓉镇'),('huadou','huadongzhen','花东镇'),('huadou','huashanzhen','花山镇'),('huadou','jiuqu','旧区'),('huadou','shanqiandadao','山前大道'),('huadou','shiling','狮岭'),('huadou','tieluxi','铁路西'),('huadou','tanbuzhen','炭步镇'),('huadou','xinqu1','新区'),('luogang','kaifadongqu','开发东区'),('luogang','kaifaxiqu','开发西区'),('luogang','kexuecheng','科学城'),('luogang','xintang','新塘'),('nansha','dagangzhen','大岗镇'),('nansha','dongyongzhen','东涌镇'),('nansha','huangge','黄阁'),('nansha','henglizhen2','横沥镇'),('nansha','jinzhou2','金洲'),('nansha','lanhezhen','榄核镇'),('nansha','nanshaqufu','南沙区府'),('nansha','xinkenzhen','新垦镇');
/*!40000 ALTER TABLE `lj_street` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-10 14:10:44
