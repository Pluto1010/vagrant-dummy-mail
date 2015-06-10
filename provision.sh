export DEBIAN_FRONTEND=noninteractive

service chef-client stop
update-rc.d chef-client disable

service puppet stop
update-rc.d puppet disable

if [ "$[$(date +%s) - $(stat -c %Z /var/lib/apt/periodic/update-success-stamp)]" -ge 86400 ]; then
	apt-get update
fi

apt-get install -y htop dovecot-imapd postfix mailutils

echo dummy.dev > /etc/mailname
cp /vagrant/main.cf /etc/postfix/
cp /vagrant/virtual-regexp /etc/postfix/

postmap /etc/postfix/virtual-regexp
touch /etc/postfix/virtual && postmap /etc/postfix/virtual

service postfix restart

cp /vagrant/pam-dovecot /etc/pam.d/dovecot
cp /vagrant/dovecot.conf /etc/dovecot/

service dovecot restart

id -u dummy &>/dev/null || useradd -m -G mail --password '$6$OcOW2DkB$uUI3xxsZpL3mRSlgn9vcnA1Q6.7.wv00LAG6SYkbIneOUxfEQS7PaSg4leFiRKcr/C0QFFTwmACT/x/o7rI/2/' dummy

