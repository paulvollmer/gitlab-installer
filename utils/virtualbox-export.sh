#!/bin/bash

echo "gitlab-installer - virtualbox-export"
echo "===================================="

if [ ! -f "gitlab.rb" ]; then
  echo "missing gitlab.rb file."
  echo "check out the 'gitlab.rb.example' file"
  exit
fi

echo "create the vm"
vagrant up
vagrant halt

if [ -f "gitlab-vm.ova" ]; then
  echo "gitlab-vm.ova file already exist. rename it to gitlab-vm-backup.ova"
  mv "gitlab-vm.ova" "gitlab-vm-backup.ova"
fi

echo "export virtualbox appliance"
VBoxManage export "gitlab-vm" --output "gitlab-vm.ova"
echo "successful exported appliance"
