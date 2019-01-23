#cp ~/.bashrc ~/.bash_profile .
#echo "==> Retrieving Magento Community Edition: "
#cp ~/Downloads/Magento-CE-2.3.0_sample_data-2018-11-27-10-31-01.zip .
#echo ""
#echo "==> Retrieving XAMPP 7.1.25 / PHP 7.1.25: "
#wget https://www.apachefriends.org/xampp-files/7.1.25/xampp-linux-x64-7.1.25-0-installer.run
echo ""
echo "==> Starting vagrant: "
#vagrant destroy -f; sleep 5; vagrant up; vagrant ssh
vagrant destroy -f; sleep 5; vagrant up
ssh -Y -i .vagrant/machines/default/virtualbox/private_key vagrant@192.168.33.12
