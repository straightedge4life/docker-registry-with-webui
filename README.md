## Docker Registry + Web UI

  
##### 环境要求:  
*  docker
*  docker-compose

##### 1. start.sh增加可执行权限并执行  
```bash
chmod +x ./start.sh
./start.sh
```


##### 2.运行容器  
```bash
docker-compose up -d
```

##### 3.使用  
访问ip:8080或者localhost:8080进入Web UI对仓库进行管理，默认账户为admin admin。  
admin账户权限仅为UI_ADMIN,无法在docker进行登录、推送、拉取等操作。  
需要添加wirte-all权限。  
在本地或局域网内机器docker login [ip:5000]  
然后输入账号密码即可，推送镜像的话先打tag，tag格式是:`ip:5000/账号/仓库名:tag`
举例，我域名是192.168.0.101，账号是rob，仓库my-php,版本是7.1.3那tag为:  
```
192.168.0.101/rob/my-php:7.1.3
```  
推送的时候也是  
```bash
docker push 192.168.0.101/rob/my-php:7.1.3
```
