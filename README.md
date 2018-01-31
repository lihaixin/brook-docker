# brook使用指南

##  brook 介绍
Brook 是一款新型的全平台(Linux/MacOS/Windows/Android/iOS) S5代理软件,目前使用效果不错

## docker 服务器使用
	docker run -d \
	               -p 61089:61089 -p 61089:61089/udp \
	               -e password=pwd \
                       -e RATE=10mbit \
                       --cap-add=NET_ADMIN \
	               --name brook \
	                lihaixin/brook
	                
可以使用portainer UI管理面版快速给员工创建

## docker 客户端使用

     docker run -d \
	               -p 1080:1080 \
	               -e protocol=client \
	               -e server=youserverip:port
	               -e password=pwd \
	               --name brook-client \
	                lihaixin/brook
	           
	           
## 安卓客户端使用

- 下载和安装安卓客户端 ( [下载地址](https://github.com/txthinking/brook#download))
- 打开brook
-  选择正确的类型，输入服务器地址和端口，输入密码 
-  按开始启动
-     * 这里会提升是否容许VPN权限，点击`同意`
-   完成
- 演示：
    - chrome 游览器演示
    - youtube 客户端演示
    - fast 速度测试演示
    
视频演示地址：

## windows客户端使用

### 准备工作

* windows版本 >= 7
* 系统没有安装其他代理工具
* 没有手动修改过代理
* Windows must has `Internet Explorer` installed (Installed by default)
* Let Chrome or Firefox or other modern browser be your default browser
* Uninstall all antivirus softwares (Optional)
    * If something wrong, please do this
    * If you are in China, strongly recommend do this

### Run Brook Windows Client

1. Download `Brook.exe` for Windows (The link can be found [here](https://github.com/txthinking/brook#download))
1. Right click `Brook.exe`, select run as administrator. A key icon will appear in system bar
1. Click the key icon -> `Setting`, your browser will open a setting page
1. Choose correct type; type your server address; type your password. Click `Save`
1. Click the key icon -> `Start`
1. Finished

## 苹果MAC 客户端使用

### 准备工具

* MacOS version >= 10.12
* Don't run any other proxy tool
* Don't change proxy setting manually

### Run Brook MacOS Client

1. Download `Brook.app.zip` for MacOS (The link can be found [here](https://github.com/txthinking/brook#download))
1. Double click `Brook.app.zip`, You will get `Brook.app` (Your system may hidden file suffix name)
1. Double click `Brook.app`. A key icon will appear in system bar
    * If MacOS prompts it is from an unidentified developer, then go System Preferences -> Security & Privacy, click Open Anyway
1. Click the key icon -> `Setting`, your browser will open a setting page
1. Choose correct type; type your server address; type your password. Click `Save`
1. Click the key icon -> `Start`
    * This step will ask you system password
1. Finished
1. [Optional] You may prefer copy `Brook.app` into your Application folder, then it will appear in launchpad

## 苹果手机iphone客户端使用

### 准备工作

* 你必须有非中国区的苹果ID
* 退出其他代理/VPN软件

### Run Brook iOS Client

1. Download and install Brook for iOS (The link can be found [here](https://github.com/txthinking/brook#download))
1. Open Brook
1. Choose correct type; type your server address; type your password
1. Tap Start button
    * This step will ask you VPN permission, tap `Allow`
1. Finished

 
##更多参考
- https://github.com/txthinking/brook/wiki



