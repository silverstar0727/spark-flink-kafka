# install anaconda 
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
sh Anaconda3-2019.03-Linux-x86_64.sh
source ~/.bashrc
conda list

# create virtual environment
cd ~/spark
conda create -n spark
conda activate spark

# install java, scala
sudo apt-get update

sudo apt-get install default-jre -y
sudo apt-get install openjdk-11-jre-headless

sudo apt-get install scala -y

# install spark
# https://spark.apache.org/releases/spark-release-3-2-0.html
curl -O https://dlcdn.apache.org/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz
tar xvf spark-3.2.0-bin-hadoop3.2.tgz

sudo mv spark-3.2.0-bin-hadoop3.2.tgz /opt/spark

# ~/.bashrc에 등록 후 source ~/.bashrc
export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

rm -rf spark-3.2.0-bin-hadoop3.2.tgz

# spark setting
/opt/spark/sbin/start-master.sh
# <external ip>:8080 접속후 주소를 아래에 작성
/opt/spark/sbin/start-slave.sh spark://instance-1.us-central1-a.c.summarization-336407.internal:7077

# start pyspark
/opt/spark/bin/pyspark

# install pyspark
conda install pyspark -y
# pyspark

# $SPARK_HOME/sbin/stop-slave.sh
# $SPARK_HOME/sbin/stop-master.sh


## https://phoenixnap.com/kb/install-spark-on-ubuntu
# sudo apt install default-jdk scala git -y
