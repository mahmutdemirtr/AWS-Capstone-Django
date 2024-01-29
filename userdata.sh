#!/bin/bash
apt-get update -y
apt-get install git -y
apt-get install python3 -y
apt install python3-pip -y
pip3 install boto3
apt  install awscli -y
cd /home/ubuntu/
TOKEN=$(aws --region=us-east-1 ssm get-parameter --name /emre/capstone/token --with-decryption --query 'Parameter.Value' --output text)
git clone https://$TOKEN@github.com/mahmutdemirtr/AWS-Capstone-Django.git
cd /home/ubuntu/AWS-Capstone-Django
apt-get install python3.10-dev default-libmysqlclient-dev -y
pip3 install -r requirements.txt
cd /home/ubuntu/AWS-Capstone-Django/src
python3 manage.py collectstatic --noinput
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80