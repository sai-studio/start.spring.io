FROM registry.cn-shenzhen.aliyuncs.com/dgut_lab/sai-openjdk
MAINTAINER Sai <dgsai@vip.qq.com>
VOLUME /tmp
ADD target/start-site-exec.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
