#!/bin/bash

set -e

PRIVATE_KEY=$(jq -r '.private_key' ~/popm-address.json)
if [ -z "$PRIVATE_KEY" ]; then
  echo "Ошибка: приватный ключ не найден в popm-address.json. Проверьте файл."
  exit 1
fi

# Уведомляем пользователя о сохранении данных
echo "Кошелек успешно создан. Сохраните данные из файла ~/popm-address.json в надежное место."
cat ~/popm-address.json

# Устанавливаем screen
sudo apt install -y screen

# Настройка переменных окружения
echo "export POPM_BTC_PRIVKEY=$PRIVATE_KEY' >> ~/.bashrc
echo "export POPM_STATIC_FEE=500" >> ~/.bashrc
echo "export POPM_BFG_URL=wss://testnet.rpc.hemi.network/v1/ws/public" >> ~/.bashrc
source ~/.bashrc

# Создаем screen сессию и запускаем ноду
screen -dmS hemi bash -c "cd ~/hemi && ./popmd"

# Информация для пользователя
echo "Нода запущена в screen сессии с именем 'hemi'."
echo "Для просмотра логов выполните команду: screen -r hemi"
echo "Чтобы выйти из логов, используйте комбинацию CTRL+A+D."
echo "Если логи не отображаются, нажмите CTRL+C и выполните команду ./popmd заново."
