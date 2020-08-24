1. SSH into server as root (if no user with superuser privileges exists)

2. Create an account with superuser privileges if not yet existing:
```bash
adduser cookietempleuser

usermod -aG sudo cookietempleuser

su cookietempleuser
```

3. Enable firewall
```bash
ufw allow OpenSSH
ufw enable
```

4. Clone the code and start the deployment script! Ensure beforehand that the user account and the URL are still matching!
```bash
cd ~

git clone https://github.com/mlf-core/mlf_core_website
```
```bash
sudo bash mlf_core_website/deployment_scripts/setup.sh
```
