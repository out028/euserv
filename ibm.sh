#!/bin/bash

read -p "请输入app名称：" name

read -p "请输入uuid：" UUID

wget https://github.com/zsxwz/v2ray/raw/master/start

mkdir ibm
chmod -v 0755 ibm
cd ibm

cat > manifest.yml <<-"EOF"
applications:
        - name: ${name}
          instances: 1
          memory: 256M
          random-route: true
          buildpacks:
                  - binary_buildpack
EOF
chmod 0755 manifest.yml

cat > server.py <<-EOF
import os
status = os.system('/app/start')
EOF
chmod 0755 server.py

cat > Procfile <<-EOF
web: python server.py
EOF
chmod 0755 Procfile

mkdir v2
chmod -v 0755 v2
cd v2

wget https://github.com/v2fly/v2ray-core/releases/download/v4.29.0/v2ray-linux-64.zip

unzip v2ray-linux-64.zip
ls |grep -Ev ^v2ray$ |grep -Ev ^v2ctl$ |xargs rm -rf
mv v2ray $name

base64 <<< "{
          "log": {
            "access": "none",
            "loglevel": "error"
          },
          "inbounds": [
            {
              "port": 8080,
              "protocol": "vmess",
              "settings": {
                "clients": [
                  {
                    "id": "${UUID}",
                    "alterId": 64
                  }
                ]
              },
              "streamSettings": {
                "network":"ws",
                "wsSettings": {
                  "path": "/zs123"
                }
              }
            }
          ],
          "outbounds": [
            {
              "protocol": "freedom"
            }
          ]
        }" > config

cd  -

tar zcvf v2.tar.gz v2
cat v2.tar.gz |base64 > ibm.py
rm -rf v2 v2.tar.gz

