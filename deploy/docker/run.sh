#!/usr/bin/env bash
#docker run -d -p 7788:8080 --name css-spring registry.cn-shenzhen.aliyuncs.com/dgut_lab/css-spring-start-site

# 加了 --rm 参数，当容器 stop 或 docker重启时，容器就会被删除。
docker run -d -p 7788:8080 --name css-spring --rm registry.cn-shenzhen.aliyuncs.com/dgut_lab/css-spring-start-site
