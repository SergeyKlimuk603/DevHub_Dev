# Перед запуском скрипта нужно авторизоваться в DevHub:
# sf org login devhub --set-default --alias DevHub_Dev

# Для запуска скрипта нужно в терминале находясь в корне проекта выполнить следующую команду:
# $ ./scripts/UnofficialSf/createScratchWithUsfPackages.sh

# Сам файл при этом должен быть исполняемым, для этого нужно один раз выполнить команду: 
# chmod +x ./scripts/UnofficialSf/createScratchWithUsfPackages.sh

# Если возникают ошибки при выполнении скрипта, возможной причиной может быть неправильная кодировка скрипта,
# (такое бывет при использовании разных ОС или редакторов). В этом случае нужно перекодировать файл в UTF-8 без BOM.
# В Linux это можно сделать с помощью команды: 
# sed -i.bak 's/\r$//' ./scripts/UnofficialSf/createScratchWithUsfPackages.sh
# источник: https://askubuntu.com/questions/803162/how-to-change-windows-line-ending-to-unix-version#:~:text=Option%202%3A,txt.bak.

set -e

# --- Настройки ---
DEVHUB_ALIAS="DevHub_Dev"
SCRATCH_ALIAS="ScratchOrg_Scr"
SCRATCH_DEF="config/project-scratch-def.json"
DURATION_DAYS=30

# Пакеты UnofficialSF — замените на реальные 04t… version IDs
PACKAGES=(
    "04t8b00000170r5AAA" # FlowActionsBasePack v3.19
    "04t5G000004fzDQQAY" # FlowScreenComponentsBasePack v3.3.10
    "04t5G000004fzARQAY" # CollectionActionsL v3.2.5
    "04tHs000001G4GyIAK" # ReactiveCollectionProcessors v1.0.4
    "04tDm000000tLdgIAE" # Flow Launcher v1.4
    "04t5G000004fzCcQAI" # datatable v4.3.6
    "04t5G000003zgYrQAI" # textAreaPlus v1.8
    "04t5G000003rUhrQAE" # NavigateEverywhereAction v1.1.1
    "04t5G0000043wpcQAA" # FlowAutoNavigate v1
    "04t5G0000043xtAQAQ" # SOQLBuildAndExecute v1.3.8
    "04t5G000004fz9nQAA" # AutoNavigate_Refresh v1.0.0
)

# Ключи установки пакета (если нет — оставьте "")
PACKAGE_KEYS=(
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
    ""
)

# --- Скрипт ---
echo "Создаем scratch org..."
sf org create scratch --definition-file ${SCRATCH_DEF} --target-dev-hub ${DEVHUB_ALIAS} --alias ${SCRATCH_ALIAS} --duration-days ${DURATION_DAYS} --set-default #

echo "Запушим локальный исходный код (если есть)..."
sf project deploy start --target-org ${SCRATCH_ALIAS}

echo "Устанавливаем пакеты UnofficialSF..."
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