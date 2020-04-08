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
say nice
