#!/bin/bash

# the default node number is 3
N=${1:-3}


# start hadoop master container
sudo docker rm -f hadoop_master &> /dev/null
echo "start hadoop_master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
		        -p 8030-8033:8030-8033 \
		        -p 9000:9000 \
                --name hadoop_master \
                -v $(pwd)/config:/
                --hostname hadoop_master \
                registry.cn-hangzhou.aliyuncs.com/yywh/hadoop:1.9.1 &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop_slave$i &> /dev/null
	echo "start hadoop_slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name hadoop_slave$i \
	                --hostname hadoop_slave$i \
	                registry.cn-hangzhou.aliyuncs.com/yywh/hadoop:1.9.1 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it hadoop_master bash
