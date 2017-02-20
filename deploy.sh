#!/bin/sh

git reset --hard

git fetch
git reset --hard origin/master

sudo systemctl stop go-present.service

sudo rm -rf /usr/share/introduction-to-go
sudo mkdir /usr/share/introduction-to-go

sudo cp -r ./* /usr/share/introduction-to-go/

sudo rm -rf /tmp/*

sudo cp ./itgo /opt/
sudo chmod -R 755 /opt/itgo

sudo cp ./go-present.service /etc/systemd/system/go-present.service

sudo systemctl daemon-reload
sudo systemctl start go-present.service
sudo systemctl enable go-present.service
sudo systemctl status go-present.service
