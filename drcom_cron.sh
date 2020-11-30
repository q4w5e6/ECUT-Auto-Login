#!/bin/sh
#获取接口ip
ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v 【自己路由器的ip地址】|grep -v 172.31.0.1|grep -v inet6|awk '{print $2}
'|tr -d "addr:"`
#(一)检测是否是登录状态
curl http://172.21.255.105 > drcom.html
check_status=`grep "Dr.COMWebLoginID_0.htm" drcom.html`
if [[ $check_status != "" ]]
then
#尚未登录
logger "【Dr.COM网页登录】上网登录窗未登录!正在尝试登录..."
curl "http://172.21.255.105:801/eportal/?c=Portal&a=login&callback=dr1004&login_method=1&user_account=【学号】%40【运营商】&user_password=【密码】&wlan_user_ip=$ip&wlan_user_ipv6=&wlan_user_mac=000000000000&wlan_ac_ip=&wlan_ac_name=&jsVersion=3.3.3&v=6173"
sleep 2s
 curl http://172.21.255.105 > drcom_test.html
 check_status=`grep "Dr.COMWebLoginID_0.htm" drcom_test.html`
 if [[ $check_status != "" ]]
 then
 logger "【Dr.COM网页登录】上网登录窗登录失败!"
 else
 logger "【Dr.COM网页登录】上网登录窗登录成功!"
 fi
 rm drcom_test.html
fi
rm drcom.html
