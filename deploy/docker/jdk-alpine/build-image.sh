#!/usr/bin/env bash
docker build -t sai-openjdk:14-alpine .
docker tag sai-openjdk:14-alpine registry.cn-shenzhen.aliyuncs.com/dgut_lab/sai-openjdk
docker push registry.cn-shenzhen.aliyuncs.com/dgut_lab/sai-openjdk
