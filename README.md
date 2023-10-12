
# 42_cloud1

You have to install ansible, azure module and setup azure credentials.

``` bash
ansible-playbook deploy_VMs.yml
```
1. it creates 2 VMs on azure with values taken from inv/variables.yaml
2. remove old ssh keys, create new, setup and put it in ~/.ssh named like VMs
3. fill up the inv/inventory.ini file with created VM ip and the path to ssh public key

``` bash
ansible-playbook -i inv/inventory.ini setup_inception.yml
```

1. it takes credentials and ip address from  inv/inventory.ini
2. connect every vm from inv/inventory.ini, and call the task from tasks/connect_and_setup_vm.yml

connect_and_setup_vm.yml
this tasks install all dependencies needed to launch ansible, copy the inception on VM and run its playbook (42_cloud1/inception/setup_inception_VM.yml)

42_cloud1/inception/setup_inception_VM.yml
install all dependencies of inception (docker, make etc.)

``` bash
ansible-playbook -i inv/inventory.ini delete_inception.yml
```

stop docker on all VMs and fclean all

``` bash
ansoble-playbook delete_VMs.yml
```

removes all VMs
