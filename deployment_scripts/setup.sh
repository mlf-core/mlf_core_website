#!/bin/bash
# Reference:
# https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-gunicorn-and-nginx-on-ubuntu-18-04

apt-get update

pip3 install gunicorn

python3 setup.py clean --all install

cp /home/cookietempleuser/mlf_core_website/deployment_scripts/mlf_core_website.service \
/etc/systemd/system/mlf_core_website.service

systemctl start mlf_core_website

systemctl enable mlf_core_website

cp /home/cookietempleuser/mlf_core_website/deployment_scripts/mlf_core_website \
/etc/nginx/sites-available/mlf_core_website

ln -s /etc/nginx/sites-available/mlf_core_website /etc/nginx/sites-enabled

nginx -t

systemctl restart nginx

ufw delete allow 5000

ufw allow 'Nginx Full'

add-apt-repository ppa:certbot/certbot -y

apt install python3-certbot-nginx -y

certbot --nginx -d mlf-core.com -d www.mlf-core.com --non-interactive --agree-tos -m lukas.heumos@posteo.net
