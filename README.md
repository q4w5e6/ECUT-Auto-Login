## 东华理工大学校园网自动登录
* openwrt系统路由器均可用，其他暂未知
## 使用方法：
1.  下载登录所需的sh文件。
2.  通过winSCP的SCP文件协议或其他ssh方法将文件上传到/etc/
3.  给文件增加执行权限:
<br>cd /etc/
<br>chmod +x drcom_cron.sh
* 或：
<br>winscp中右键文件-属性，将三个x全勾上，确定。
4.  登录路由器管理页面-系统-计划任务，加上一行：
<br>*/5 * * * * /etc/mysh/drcom_cron.sh<br>
<br>(每隔五分钟自动执行登录检测)
