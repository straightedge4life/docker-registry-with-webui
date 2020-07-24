## Docker Registry + Web UI + Nginx   

##### 准备:  
*  一个域名，并添加两条A解析到服务器IP，分别用于Registry和Web UI
*  域名的SSL证书，key+pem
  
##### 环境要求:  
*  docker
*  docker-compose

##### 1. start.sh增加可执行权限并执行  
```bash
chmod +x ./start.sh
./start.sh
```
##### 2.复制nginx.conf  
```bash
cp ./conf/example-nginx.conf ./conf/nginx.conf
```
##### 3.编辑nginx.conf  

分别将22行和66行的`server_name`改为自己的域名。  
22行为Registry域名，在docker login/tag/pull/push时用到。  
66行为Web UI域名，用于管理仓库、用户等...

##### 4.上传ssl证书  
将ssl证书分别命名为`ssl.pem`和`ssl.key`并放到`conf/ssl`目录中  

##### 5.运行容器  
```bash
docker-compose up -d
```

##### 6.使用  
访问Registry域名对仓库进行管理，默认账户为admin admin。  
admin账户权限仅为UI_ADMIN,无法在docker进行登录、推送、拉取等操作。  
需要添加wirte-all权限。  
在本地或其他机器docker login [Registry域名]  
然后输入账号密码即可，推送镜像的话先打tag，tag格式是:`Registry域名/账号/仓库名:tag`
举例，我域名是my-registry.com，账号是rob，仓库my-php,版本是7.1.3那tag为:  
```
my-registry.com/rob/my-php:7.1.3
```  
推送的时候也是  
```bash
docker push my-registry.com/rob/my-php:7.1.3
```
