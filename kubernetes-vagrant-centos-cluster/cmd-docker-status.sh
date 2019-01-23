# What docker containers are running on the nodes in the cluster

for h in 172.17.8.101 172.17.8.102 172.17.8.103 
do
    echo ======================= Node: $h ========================
    ssh -i .vagrant/machines/$h/virtualbox/private_key vagrant@$h docker ps -a
    echo
done

