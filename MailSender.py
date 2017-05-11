# coding:utf-8

import smtplib
import mailconfig
from email.mime.text import MIMEText


class SendEmail(object):
    def __init__(self, senderaddr, receiveaddr, subject, content):
        """
        邮件发送类
        :param senderaddr:发件人地址
        :param receiveaddr:收件人地址
        :param subject:邮件主题
        :param content:邮件正文
        """
        self.senderAddr = senderaddr
        self.receiveAddr = receiveaddr
        self.message = MIMEText(content, 'plain', 'utf-8')
        self.message["From"] = self.fmt_mail_addr(senderaddr)
        self.message["to"] = self.fmt_mail_addr(receiveaddr)
        self.message["subject"] = subject

    @staticmethod
    def fmt_mail_addr(mailaddr):
        """
        格式化邮件地址
        :param mailaddr: 邮件地址
        :return: 格式化后的邮件地址
        """
        return '<%s>' % mailaddr

    def send(self):
        """
        发送邮件
        :return: null
        """
        try:
            smt_obj = smtplib.SMTP(mailconfig.smtpserver)
            smt_obj.login(user=mailconfig.userName, password=mailconfig.password)
            smt_obj.sendmail(self.senderAddr, self.receiveAddr, self.message.as_string())
            smt_obj.quit()
            print("邮件发送成功")
        except smtplib.SMTPException as ex:
            print(ex)
            print("发送邮件失败")

def test_run():
    send_mail = SendEmail("yichen_deng@163.com", "470868299@qq.com", "公式邮件", "麻烦帮我看下收到邮件没，收到希望能回复一下。谢谢")
    send_mail.send()


# test_run()
