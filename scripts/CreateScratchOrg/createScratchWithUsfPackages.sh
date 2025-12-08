# Данный скрипт создает новый scratch org, деплоит в него локальный исходный код (если есть) и устанавливает
# набор пакетов Ids и ключи которых указанны в переменных PACKAGES и PACKAGE_KEYS соответсвенно.

# Перед запуском скрипта нужно авторизоваться в DevHub:
# sf org login devhub --set-default --alias DevHub_Dev

# Для запуска скрипта нужно в терминале находясь в корне проекта выполнить следующую команду:
# $ ./scripts/CreateScratchOrg/createScratchWithUsfPackages.sh

# Сам файл при этом должен быть исполняемым, для этого нужно один раз выполнить команду: 
# chmod +x ./scripts/CreateScratchOrg/createScratchWithUsfPackages.sh

# Если возникают ошибки при выполнении скрипта, возможной причиной может быть неправильная кодировка скрипта,
# (такое бывет при использовании разных ОС или редакторов). В этом случае нужно перекодировать файл в UTF-8 без BOM.
# В Linux это можно сделать с помощью команды: 
# sed -i.bak 's/\r$//' ./scripts/CreateScratchOrg/createScratchWithUsfPackages.sh
# источник: https://askubuntu.com/questions/803162/how-to-change-windows-line-ending-to-unix-version#:~:text=Option%202%3A,txt.bak.

set -e

# --- Настройки ---
DEVHUB_ALIAS="DevHub_Dev"
SCRATCH_ALIAS="ScratchOrg_Scr"
SCRATCH_DEF="config/project-scratch-def.json"
DURATION_DAYS=30

# Пакеты - введите реальные 04t… version IDs
PACKAGES=(
    "04txxxxxxxxxxxxAAA"
    "04txxxxxxxxxxxxQAY"
)

# Ключи установки пакета (если нет — оставьте "")
PACKAGE_KEYS=(
    ""
    ""
)

# --- Скрипт ---
echo "Создаем scratch org..."
sf org create scratch --definition-file ${SCRATCH_DEF} --target-dev-hub ${DEVHUB_ALIAS} --alias ${SCRATCH_ALIAS} --duration-days ${DURATION_DAYS} --set-default #

echo "Запушим локальный исходный код (если есть)..."
sf project deploy start --target-org ${SCRATCH_ALIAS}

echo "Устанавливаем пакеты ..."
for i in "${!PACKAGES[@]}"; do
  PKG="${PACKAGES[$i]}"
  KEY="${PACKAGE_KEYS[$i]}"
  CMD="sf package install --package ${PKG} --target-org ${SCRATCH_ALIAS} --wait 20"
  if [ -n "${KEY}" ]; then
    CMD="${CMD} --installation-key ${KEY}"
  fi
  echo "Installing package ${PKG} ..."
  eval ${CMD}
done

echo "Все пакеты установлены. Открываем scratch org..."
sf org open --target-org ${SCRATCH_ALIAS}