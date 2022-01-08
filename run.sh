docker build . -t yodeng/creatimage:latest
docker run -d --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor=unconfined -p 10022:22 -e ACCESS_KEY=xxx -e ACCESS_SECRET=xxx -e OSS_URL=xxx -e OSS_BUCKET=xxx -e MNT_POINT=/share/oss --restart always --name creatimage yodeng/creatimage:latest
# docker-compose up -d 
