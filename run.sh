docker build . -t yodeng/ossfs:latest
docker run -d --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor=unconfined -e ACCESS_KEY=XXXX -e ACCESS_SECRET=XXXX -e OSS_URL=http://oss-cn-beijing.aliyuncs.com -e OSS_BUCKET=XXXX -e MNT_POINT=/data/oss --name ossfs-docker --restart always yodeng/ossfs:latest
# docker-compose up -d 
