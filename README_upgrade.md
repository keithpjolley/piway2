Changes required after a pihole software upgrade

$ sudo vi /etc/dnsmasq.d/01-pihole.conf

#addn-hosts=/etc/pihole/local.list
addn-hosts=/usr/local/opt/pirouter/tmp/hosts.local


$ sudo vi /etc/dnsmasq.d/02-pihole-dhcp.conf

#dhcp-leasefile=/etc/pihole/dhcp.leases
dhcp-leasefile=/usr/local/opt/pirouter/tmp/dhcp.leases

$ sudo chown pihole.pihole /usr/local/opt/pirouter/tmp/dhcp.leases

# repoint /etc/ethers
$ ls -l /etc/ethers
lrwxrwxrwx 1 root root 49 Dec 17 14:18 /etc/ethers -> /usr/local/opt/pirouter/tmp/dhcp-hostsfile.txt


