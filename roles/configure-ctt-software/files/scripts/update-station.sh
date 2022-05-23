#!/bin/bash
home='/home/ctt/ctt'
sudo -u ctt mkdir -p $home
cd $home
git_url='https://github.com/cellular-tracking-technologies/sensor-station-software.git'

check_run() {
  echo "$changed_files" | grep --quiet "$1" && eval "$2"
}

dir='/home/ctt/ctt/sensor-station-software'
# check if the software directory exists
if [ -d $dir ]; then
  # directory exists - stash any changes and do a git pull
  cd $dir
  sudo -u ctt git stash
  sudo -u ctt git pull
  # checking if package.json has changed
  changed_files="$(git diff-tree -r --name-only --no-commit-id ORIG_HEAD HEAD)" 
  check_run package.json "npm update && npm run build"
else
  cd $home
  echo "cloning sensor-station-software repo to $dir"
  sudo -u ctt git clone $git_url
  cd $dir
  npm update && npm run build
fi

sudo systemctl restart station-hardware-server
sudo systemctl restart station-lcd-interface
sudo systemctl restart station-radio-interface
sudo systemctl restart station-web-interface

sudo sh -c "date -u +'%Y-%m-%d %H:%M:%S' > /etc/ctt/station-software"

echo 'Sensor Station Update Complete\n'