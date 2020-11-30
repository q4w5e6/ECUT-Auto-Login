#!/bin/sh
#自动注销（只需修改路由器ip为自己的）
#(一)检测是否是登录状态
logger "【Dr.COM网页注销】自动注销一次"
curl http://172.21.255.105 > drcomout.html
check_status=`grep "Dr.COMWebLoginID_1.htm" drcomout.html`
#获取ip
ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v 【自己路由器的ip地址】|grep -v 172.31.0.1|grep -v inet6|awk '{print $2}
'|tr -d "addr:"`
if [[ $check_status != "" ]]
then
    #已登录
logger "【Dr.COM网页注销】开始尝试注销..."
curl "http://172.21.255.105:801/eportal/?c=Portal&a=logout&callback=dr1003&login_method=1&user_account=drcom&user_password=123&ac_logout=0&register_mode=1&wlan_user_ip=$ip&wlan_user_ipv6=&wlan_vlan_id=1&wlan_user_mac=000000000000&wlan_ac_ip=&wlan_ac_name=&jsVersion=3.3.3&v=8159"
sleep 2s
curl http://172.21.255.105 > drcomout_test.html
check_status=`grep "Dr.COMWebLoginID_1.htm" drcomout_test.html`
if [[ $check_status != "" ]]
then
logger "【Dr.COM网页注销】上网登录窗注销失败!"
else
logger "【Dr.COM网页注销】上网登录窗已注销!"
fi
rm drcomout_test.html
fi
logger "【Dr.COM网页注销】结束自动注销"
rm drcomout.html