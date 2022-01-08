### 利用docker创建阿里云实例镜像

docker容器内部挂载oss存储，并提供容器ssh远程访问，用于远程登录和部署运行环境


```
docker build . -t yodeng/creatimage:latest

docker run -d --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor=unconfined -e ACCESS_KEY=XXXX -e ACCESS_SECRET=XXXX -e OSS_URL=http://oss-cn-beijing.aliyuncs.com -e OSS_BUCKET=XXXX -e MNT_POINT=/data/oss --name creatAliyunImage --restart always  yodeng/creatimage:latest
```

或者使用docker-compose

```
docker-compose up -d 
```

