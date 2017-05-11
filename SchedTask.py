# coding:utf-8

import time, os, sched

schedule = sched.scheduler(time.time, time.sleep)


def work(msg, starttime):
    print("任务执行的时刻：" +  fmt_time(time.time()) + ",传达的消息：" + msg + ",任务建立时刻：" + fmt_time(starttime))


def fmt_time(now):
    fmt = "%Y-%m-%d %H:%M:%S"
    return time.strftime(fmt,time.localtime(now))

schedule.enter(10, 1, work, ("hello world-10", time.time()))
schedule.enter(38, 1, work, ("hello world-38", time.time()))
schedule.enter(12, 1, work, ("hello world-12", time.time()))
schedule.enter(80, 1, work, ("hello world-80", time.time()))
schedule.enter(100, 1, work, ("hello world-100", time.time()))

schedule.run()
