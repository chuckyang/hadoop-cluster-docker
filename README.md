## 原文连接
https://github.com/kiwenlau/hadoop-cluster-docker.git
增加了hadoop 版本，jdk升级为1.8
## Run Hadoop Cluster within Docker Containers

- Blog: [Run Hadoop Cluster in Docker Update](http://kiwenlau.com/2016/06/26/hadoop-cluster-docker-update-english/)
- 博客: [基于Docker搭建Hadoop集群之升级版](http://kiwenlau.com/2016/06/12/160612-hadoop-cluster-docker-update/)


![alt tag](https://raw.githubusercontent.com/kiwenlau/hadoop-cluster-docker/master/hadoop-cluster-docker.png)

## run docker compose
sudo docker stack deploy -c docker-compose.yml --with-registry-auth hadoop

### 3 Nodes Hadoop Cluster

##### 1. pull docker image

```
sudo docker pull kiwenlau/hadoop:1.0
```

##### 2. clone github repository

```
git clone https://github.com/kiwenlau/hadoop-cluster-docker
```

##### 3. create hadoop network

```
sudo docker network create --driver=bridge hadoop
```

##### 4. start container

```
cd hadoop-cluster-docker
sudo ./start-container.sh
```

**output:**

```
start hadoopmaster container...
start hadoopslave1 container...
start hadoopslave2 container...
root@hadoopmaster:~# 
```
- start 3 containers with 1 master and 2 slaves
- you will get into the /root directory of hadoopmaster container

##### 5. start hadoop

```
./start-hadoop.sh
```

##### 6. run wordcount

```
./run-wordcount.sh
```

**output**

```
input file1.txt:
Hello Hadoop

input file2.txt:
Hello Docker

wordcount output:
Docker    1
Hadoop    1
Hello    2
```

### Arbitrary size Hadoop cluster

##### 1. pull docker images and clone github repository

do 1~3 like section A

##### 2. rebuild docker image

```
sudo ./resize-cluster.sh 5
```
- specify parameter > 1: 2, 3..
- this script just rebuild hadoop image with different **slaves** file, which pecifies the name of all slave nodes


##### 3. start container

```
sudo ./start-container.sh 5
```
- use the same parameter as the step 2

##### 4. run hadoop cluster 

do 5~6 like section A

