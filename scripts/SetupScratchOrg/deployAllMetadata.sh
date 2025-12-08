# Данный скрипт деплоит в scratch org локальный исходный код (если есть).

# Для запуска скрипта нужно в терминале находясь в корне проекта выполнить следующую команду:
# $ ./scripts/SetupScratchOrg/deployAllMetadata.sh

# Сам файл при этом должен быть исполняемым, для этого нужно один раз выполнить команду: 
# chmod +x ./scripts/SetupScratchOrg/deployAllMetadata.sh

# Если возникают ошибки при выполнении скрипта, возможной причиной может быть неправильная кодировка скрипта,
# (такое бывет при использовании разных ОС или редакторов). В этом случае нужно перекодировать файл в UTF-8 без BOM.
# В Linux это можно сделать с помощью команды: 
# sed -i.bak 's/\r$//' ./scripts/SetupScratchOrg/deployAllMetadata.sh
# источник: https://askubuntu.com/questions/803162/how-to-change-windows-line-ending-to-unix-version#:~:text=Option%202%3A,txt.bak.

set -e

# --- Настройки ---
SCRATCH_ALIAS="ScratchOrg_Scr"

# --- Скрипт ---
echo "Запушим локальный исходный код (если есть)..."
sf project deploy start --target-org ${SCRATCH_ALIAS}

