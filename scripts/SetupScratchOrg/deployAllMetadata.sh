# Данный скрипт создает новый scratch org, деплоит в него локальный исходный код (если есть) и устанавливает
# набор пакетов Ids и ключи которых указанны в переменных PACKAGES и PACKAGE_KEYS соответсвенно.

# Перед запуском скрипта нужно авторизоваться в DevHub:
# sf org login devhub --set-default --alias DevHub_Dev

# Для запуска скрипта нужно в терминале находясь в корне проекта выполнить следующую команду:
# $ ./scripts/CreateScratchOrg/deployAllMetadata.sh

# Сам файл при этом должен быть исполняемым, для этого нужно один раз выполнить команду: 
# chmod +x ./scripts/CreateScratchOrg/deployAllMetadata.sh

# Если возникают ошибки при выполнении скрипта, возможной причиной может быть неправильная кодировка скрипта,
# (такое бывет при использовании разных ОС или редакторов). В этом случае нужно перекодировать файл в UTF-8 без BOM.
# В Linux это можно сделать с помощью команды: 
# sed -i.bak 's/\r$//' ./scripts/CreateScratchOrg/deployAllMetadata.sh
# источник: https://askubuntu.com/questions/803162/how-to-change-windows-line-ending-to-unix-version#:~:text=Option%202%3A,txt.bak.

# После создания scratch org пароль пользователя можно сгенерировать командой:
# sf org generate password --target-org ScratchOrg_Scr

set -e

# --- Настройки ---
SCRATCH_ALIAS="ScratchOrg_Scr"

# --- Скрипт ---
echo "Запушим локальный исходный код (если есть)..."
sf project deploy start --target-org ${SCRATCH_ALIAS}

