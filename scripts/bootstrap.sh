#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
# install necessary software on clean Ubuntu system
sudo apt-get update

# tools
sudo apt-get -y install git

# openjdk
sudo apt-get -y install openjdk-8-jdk

# scala
wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i scala-2.11.8.deb
sudo apt-get update
sudo apt-get install scala
rm scala-2.11.8.deb

# https://github.com/thiagowfx/PKGBUILDs/blob/master/apache-spark/apache-spark.install
groupadd -r -f apache-spark
useradd -r -g apache-spark -s /usr/bin/nologin -d /var/lib/apache-spark apache-spark || true

[[ ! -d /var/lib/apache-spark ]] &&
install -d /var/lib/apache-spark

chown -R apache-spark:apache-spark /var/lib/apache-spark
chown -R apache-spark:apache-spark /opt/spark

# install spark binary release
cd /tmp && wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz
tar xvfz spark-2.0.0-bin-hadoop2.7.tgz
install -d /opt/spark
cp -r spark-2.0.0-bin-hadoop2.7/* /opt/spark
chown -R apache-spark:apache-spark /opt/spark

# configure SPARK_HOME in bashrc
echo 'export SPARK_HOME' >> /home/ubuntu/.bashrc
echo 'SPARK_HOME=/opt/spark' >> /home/ubuntu/.bashrc

cat > /etc/systemd/system/apache-spark.service << END
[Unit]
Description=Apache Spark Master and Slave Servers
After=network.target
After=systemd-user-sessions.service
After=network-online.target

[Service]
User=apache-spark
Type=forking
ExecStart=/opt/spark/sbin/start-master.sh
ExecStop=/opt/spark/sbin/stop-master.sh
TimeoutSec=30
Restart= on-failure
RestartSec= 30
StartLimitInterval=350
StartLimitBurst=10

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl start apache-spark.service
systemctl enable apache-spark.service

# http://stackoverflow.com/questions/25321139/vagrant-installing-anaconda-python
miniconda=Anaconda2-4.3.0-Linux-x86_64.sh
cd /vagrant
if [[ ! -f $miniconda ]]; then
    wget --quiet http://repo.continuum.io/archive/$miniconda
fi
chmod +x $miniconda
./$miniconda -b -p /opt/anaconda

rm $miniconda

cat > /usr/local/sbin/pyspark3 << EOF
#!/usr/bin/env bash
source activate py35 && PYSPARK_PYTHON=python3 pyspark && source deactivate py35
EOF

chmod +x /usr/local/sbin/pyspark3

sudo ufw allow 8888/tcp
