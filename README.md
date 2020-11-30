## 东华理工大学校园网自动登录
[![GitHub stars](https://img.shields.io/github/stars/q4w5e6/ECUT-Auto-Login?style=flat-square)](https://github.com/q4w5e6/ECUT-Auto-Login/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/q4w5e6/ECUT-Auto-Login?style=flat-square)](https://github.com/q4w5e6/ECUT-Auto-Login/network)
[![GitHub issues](https://img.shields.io/github/issues/q4w5e6/ECUT-Auto-Login?style=flat-square)](https://github.com/q4w5e6/ECUT-Auto-Login/issues)
[![GitHub license](https://img.shields.io/badge/license-MIT-blueviolet.svg)](https://github.com/q4w5e6/ECUT-Auto-Login/blob/main/LICENSE) 
[![GitHub All Releases](https://img.shields.io/github/downloads/q4w5e6/ECUT-Auto-Login/total?style=flat-square)](https://github.com/q4w5e6/ECUT-Auto-Login/releases)
[![GitHub contributors](https://img.shields.io/github/contributors/q4w5e6/ECUT-Auto-Login?style=flat-square)](https://github.com/q4w5e6/ECUT-Auto-Login/graphs/contributors)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/q4w5e6/ECUT-Auto-Login?style=flat-square)](https://github.com/q4w5e6/ECUT-Auto-Login/releases)
[![](https://tokei.rs/b1/github/q4w5e6/ECUT-Auto-Login?category=code)](#)
---
## 使用shell脚本自动登录校园网
* 注：openwrt系统路由器均可用，其他暂未知，可做参考
## 使用方法：
1.  [下载登录所需的shell文件](https://github.com/q4w5e6/ECUT-Auto-Login/releases/download/1.0/drcom_cron.sh)
2.  更改下载的sh文件中需要更改的四处部分：【路由器ip】、【学号】、【运营商】、【密码】。包括【】一并更改
3.  需修改部分的说明：
    - [ ] 关于路由器ip：
       
       电脑：连接路由器的那个网卡的网关
       
       手机：WiFi的网关（有的叫路由器）
    - [ ] 关于学号和密码：登录校园网的学号和密码
    - [ ] 关于运营商：电信是telecom，移动是cmcc，联通是unicom，校园网则无(直接把"%40【运营商】"全删了)
     
4.  通过winSCP的SCP文件协议或其他ssh方法将drcom_cron.sh上传到/etc/文件夹内
5.  给drcom_cron.sh增加execute权限:

      代码方式:

        cd /etc/
        chmod +x drcom_cron.sh
   
       winscp操作方式：
  
        winscp中右键文件-属性，将三个x全勾上，确定。

6.  登录路由器管理页面-系统-计划任务

    加上一行并提交：

        */3 * * * * /etc/mysh/drcom_cron.sh     
     (每隔三分钟自动执行登录检测)

## 参考
>[甲烃气瓶](https://jakting.com/archives/drcom-autologin-padavan-tgbot.html)

