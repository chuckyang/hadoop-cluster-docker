#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
sudo docker build -t registry-vpc.cn-hangzhou.aliyuncs.com/yywh/hadoop:1.9.1 .

echo ""
