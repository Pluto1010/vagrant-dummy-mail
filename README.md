# vagrant-dummy-mail
Vagrantfile that creates a VM that redirects all mail sent within it to the mailbox of a dummy user inside this VM. 

It provides IMAP&amp;SMTP servers to allow accessing that dummy users email.

This is proof of concept design to improve the development of email sending applications inside of virtual machines.

# Systemconfig
User: dummy

Password: dummy

Host-IP: 192.168.33.51

IMAP-Port: 143

SMTP-Port: 25

IMAP-Login: dummy

IMAP-Password: dummy

All mails sent over localhost:25 will be redirected to "dummy@dummy.dev".

Connect with any mail program via IMAP to the VM and view Dummy's mails.
