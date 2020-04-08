#!/usr/bin/env bash
echo "清除缓存..."
cd start-client && \
rm -rf .cache node_modules && \
echo "清除缓存完成。"
cd .. && \
mvn clean source:jar package -DskipTests && \
mvn dockerfile:build && \
mvn dockerfile:tag@tag-version && \
mvn dockerfile:push@push-latest && \
mvn dockerfile:push@push-version && \
say nice && \
docker stop css-spring && \
# 加了 --rm 参数，当容器 stop 或 docker重启时，容器就会被删除。
docker run -d -p 7788:8080 --name css-spring --rm registry.cn-shenzhen.aliyuncs.com/dgut_lab/css-spring-start-site && \
\
docker image prune -f
