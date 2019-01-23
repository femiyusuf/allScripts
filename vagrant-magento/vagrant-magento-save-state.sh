rm -f /vagrant/lampp.tar.gz
cd /opt/; tar cvf /vagrant/lampp.tar lampp/; gzip /vagrant/lampp.tar
rsync -nave ssh /vagrant/lampp.tar.gz myusuf@192.168.33.1:/Users/myusuf/work/cos1/vagrant-magento
