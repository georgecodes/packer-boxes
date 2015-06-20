#!/bin/bash

rpm –-import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-DSA-KEY.pub
rpm –-import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub

yum -y install vmware-tools-hgfs vmware-tools-esx-nox

echo “modprobe vmhgfs” > /etc/sysconfig/modules/vmhgfs.modules
chmod +x /etc/sysconfig/modules/vmhgfs.modules