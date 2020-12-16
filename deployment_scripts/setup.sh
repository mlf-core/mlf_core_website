#!/bin/bash
# Reference:
# https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-gunicorn-and-nginx-on-ubuntu-18-04
sudo apt-get install software-properties-common
sudo apt-add-repository universe
sudo apt-get update
sudo apt-get install python3-pip
sudo apt-get install python3-dev nginx -y
sudo pip3 install virtualenv

virtualenv dpenv
source dpenv/bin/activate

sudo apt-get update
pip3 install gunicorn
make install

cp /home/cookietempleuser/mlf_core_website/deployment_scripts/mlf_core_website.service \
/etc/systemd/system/mlf_core_website.service

sudo systemctl start mlf_core_website

sudo systemctl enable mlf_core_website

cp /home/cookietempleuser/mlf_core_website/deployment_scripts/mlf_core_website \
/etc/nginx/sites-available/mlf_core_website

ln -s /etc/nginx/sites-available/mlf_core_website /etc/nginx/sites-enabled

sudo nginx -t

sudo systemctl restart nginx

sudo ufw delete allow 5000

sudo ufw allow 'Nginx Full'

sudo add-apt-repository ppa:certbot/certbot -y

sudo apt install python3-certbot-nginx -y

sudo certbot --nginx -d mlf-core.com -d www.mlf-core.com --non-interactive --agree-tos -m lukas.heumos@posteo.net
