#!/bin/bash

set -e

# Обновляем пакеты
sudo apt update && sudo apt upgrade -y
sudo apt install -y jq

# Создаем папку для бинарников


# Скачиваем и извлекаем бинарик
wget https://github.com/hemilabs/heminetwork/releases/download/v0.10.0/heminetwork_v0.10.0_linux_amd64.tar.gz
mkdir hemi
sleep 2 
tar --strip-components=1 -xzvf heminetwork_v0.10.0_linux_amd64.tar.gz -C hemi
rm ~/heminetwork_v0.10.0_linux_amd64.tar.gz
cd hemi

# Генерируем tBTC кошелек
./keygen -secp256k1 -json -net="testnet" > ~/popm-address.json
sleep 3 

