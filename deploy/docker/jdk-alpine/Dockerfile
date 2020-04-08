FROM openjdk:14-alpine
MAINTAINER LiZhiXiong "dgsai@vip.qq.com"
# openjdk的最新镜像：https://hub.docker.com/_/openjdk
# 更新Alpine的软件源为国内（清华大学）的站点，因为从默认官源拉取实在太慢了。。。
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main/" > /etc/apk/repositories
# 更新alpine。
#RUN apk update && apk upgrade
## ADD与COPY的区别：ADD复制并解压，COPY仅复制。
# wait-for-it脚本到容器，微服务的容器可能会用到。
COPY wait-for-it.sh .
### 把脚本打包进镜像后，默认权限是RW,没有执行权限，需要修改权限。  ###
RUN chmod u+x wait-for-it.sh
######
####
# 中文字符集,解决中文乱码
### 参考文献 ###
# https://blog.csdn.net/cuigelasi/article/details/82852464
# https://blog.csdn.net/weixin_39153210/article/details/83617792
# https://www.jianshu.com/p/ef1b5a6dfdba
# https://my.oschina.net/u/3764794/blog/2989068
# https://www.clxz.top/2019/05/09/160241/
# https://github.com/sgerrand/alpine-pkg-glibc/
# https://github.com/gliderlabs/docker-alpine/issues/144
# 设置时区，CST 东八区
ENV TZ=Asia/Shanghai
# 设置alpine操作系统字符编码
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8
# 安装 glibc; 配置镜像源,安装 tzdata bash curl
# --no-cache参数不缓存文件，有助于减少最终体积。
COPY glibc/glibc-2.31-r0.apk .
COPY glibc/glibc-bin-2.31-r0.apk .
COPY glibc/glibc-i18n-2.31-r0.apk .

RUN \
    ALPINE_GLIBC_PACKAGE_VERSION="2.31-r0" && \
    ALPINE_GLIBC_BASE_PACKAGE_FILENAME="glibc-$ALPINE_GLIBC_PACKAGE_VERSION.apk" && \
    ALPINE_GLIBC_BIN_PACKAGE_FILENAME="glibc-bin-$ALPINE_GLIBC_PACKAGE_VERSION.apk" && \
    ALPINE_GLIBC_I18N_PACKAGE_FILENAME="glibc-i18n-$ALPINE_GLIBC_PACKAGE_VERSION.apk" && \
    apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    apk add --no-cache \
        "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" \
        tzdata bash curl && \
    # 设置系统时区
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    # 设置系统字符编码、语言
    /usr/glibc-compat/bin/localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 && \
    \
    rm "/etc/apk/keys/sgerrand.rsa.pub" && \
    \
    apk del glibc-i18n && \
    \
    apk del .build-dependencies && \
    \
    rm \
        "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" && \
    \
    rm "/root/.wget-hsts"

CMD "/bin/bash"
