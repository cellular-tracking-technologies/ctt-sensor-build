#!/bin/bash
home='/home/pi/ctt'
sudo -u pi mkdir -p $home
cd $home
get_url='https://github.com/cellular-tracking-technologies';

check_run() {
  echo "$changed_files" | grep --quiet "$1" && eval "$2"
}

dirs=("station-hardware-server" "station-lcd-interface")
for project in ${dirs[@]}; do
  dir="$home/$project"
  echo "updating project $project"
  if [ -d $dir ]; then
    cd $dir
    sudo -u pi git reset --hard origin/master
    sudo -u pi git pull
    changed_files="$(git diff-tree -r --name-only --no-commit-id ORIG_HEAD HEAD)"
    check_run package.json "npm update && npm run build"
  else
    cd $home
    project_git="$get_url/$project"
    echo "cloning git repo $project_git to $dir"
    sudo -u pi git clone $project_git
    cd $dir
    npm update && npm run build
  fi
done

dirs=("station-radio-interface" "station-interface")
for project in ${dirs[@]}; do
  dir="$home/$project"
  echo "checking updates for $project"
  if [ -d $dir ]; then
    cd $dir
    echo "pulling changes"
    sudo -u pi git reset --hard origin/v2
    sudo -u pi git pull
    echo "updating dependencies / transpile source"

    changed_files="$(git diff-tree -r --name-only --no-commit-id ORIG_HEAD HEAD)"
    check_run package.json "npm update && npm run build"
  else
    cd $home
    project_git="$get_url/$project"
    echo "cloning git repo $project_git to $dir"
    sudo -u pi git clone $project_git
    cd $dir
    # make sure they are on v2
    sudo -u pi git checkout v2
    echo "install dependencies / transpile source"
    npm update && npm run build
  fi
done

cd /home/pi/ctt/station-utils
sudo -u pi git pull

sudo pm2 restart all

sudo sh -c "date -u +'%Y-%m-%d %H:%M:%S' > /etc/ctt/station-software"

echo 'Sensor Station Update Complete\n'