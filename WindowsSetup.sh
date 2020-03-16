/root/onos/bin/onos-user-password root karaf
cat << EOF >> ~/.bash_aliases 
alias onos='/root/onos/bin/onos'
alias onos-app='/root/onos/bin/onos-app'
alias onos-create-app='/root/onos/bin/onos-create-app'
EOF
apt-get update
apt-cache search maven
apt-get install maven ssh --assume-yes
