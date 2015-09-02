#!/bin/bash

set -x
# Add vagrant user
if [ ! -d /home/vagrant ] ; then
    groupadd vagrant
    useradd -d /home/vagrant -s /bin/bash -m -g vagrant vagrant
fi

# Installing vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
curl -k -L -o /home/vagrant/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' 
chown -R vagrant /home/vagrant/.ssh

# Ensure passwords are correct
$run_cmd echo "root:vagrant" | chpasswd
$run_cmd echo "vagrant:vagrant" | chpasswd

if [ -f /etc/sudoers ] ; then
    sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
    sed -i "s/^\(.*env_keep = \"\)/\1PATH /" /etc/sudoers
    sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
    sed -i -e 's/%sudo.*ALL=.*ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
fi


