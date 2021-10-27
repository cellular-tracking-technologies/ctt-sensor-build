# [Ansible](https://www.ansible.com) Build Tool for Sensor Stations

## Requirements
This code can be run on a host Linux/Mac machine that has access to the target client machine.  It can simultaneously run build scripts on any list of IP addresses in the inventory file.  A Raspberry Pi works well for building on any set of machines on the network.

[Ansible Documentation](https://docs.ansible.com)

## Host Machine
`sudo apt install python-pip`

`sudo pip install -g ansible`

## Configure Inventory File
The ansible playbook can be run against any inventory file.  For example: [inventories/compute](inventories/compute)

Edit this file and replace the IP address with the IP address of the target machine.  (Repeat a line for each target machine.)

## Run the script on the host machine
`ansible-playbook -i inventories/compute compute_playbook.yml`


## CTT Sensor Station System Files
`/etc/ctt/ctt.conf`

* AWS S3 credentials for writing to ctt-motus-development S3 bucket

`/etc/ctt/station-id`

* Contents should only be the ID of the station

`/etc/ctt/station-image`

* Contents should only be a string indicating the station version

`/etc/ctt/modem/*`

* Modem udev rules

`/etc/ppp/peers/gprs`

* Modem ppp config file

`/etc/chatscripts/*`

* Modem chatscript files