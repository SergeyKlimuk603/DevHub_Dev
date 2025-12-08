# Start script in terminal
# $ ./scripts/UnofficialSf/installUnofficialSfPackages.sh

set -e
#Говорит bash немедленно завершить выполнение скрипта, если любая команда возвращает ненулевой код ошибки.
# В терминале каждая команда возвращает exit code:
#   0 — команда выполнилась успешно
#   любое другое число — произошла ошибка
# Без set -e скрипт продолжит выполняться, даже если какая-то команда упала, что может привести к непредсказуемым последствиям.

DEVHUB_ALIAS="DevHub_Dev" # алиас вашего Dev Hub
SCRATCH_ALIAS="ScratchOrg_Scr" # алиас, который даст новому scratch org 
SCRATCH_DEF="config/project-scratch-def.json" # путь к definition-файлу
DURATION_DAYS=30 # сколько дней живёт scratch org

# Здесь перечислите все нужные package version IDs (04t...).
# Пример: PACKAGES=("04t3X0000045abcQAA" "04t3X0000045defQAA" ...)
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

# (Опционально) если для некоторых пакетов нужен installation key (пароль) # Используйте аналогичный массив KEYs, пустая строка — если пароль не нужен 
PACKAGE_KEYS=(
    "" # если Package не требует ключа 
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

echo "Installing UnofficialSF packages..."

for i in "${!PACKAGES[@]}"; do 
    PKG="${PACKAGES[$i]}" 
    KEY="${PACKAGE_KEYS[$i]}" 
    CMD="sf package install --package ${PKG} --target-org ${SCRATCH_ALIAS} --wait 20 --publish-wait 10 --no-prompt" 
    if [ -n "${KEY}" ]; then 
        CMD="${CMD} --installation-key ${KEY}" 
    fi 
    echo "Installing package ${PKG} ..." 
    eval ${CMD} 
done

# for i in "${!PACKAGES[@]}"; do 
#     PKG="${PACKAGES[$i]}" 
#     KEY="${PACKAGE_KEYS[$i]}" 
#     CMD="sfdx force:package:install --package ${PKG} --targetusername ${SCRATCH_ALIAS} --wait 20 --publishwait 10 --noprompt" 
#     if [ -n "${KEY}" ]; then 
#         CMD="${CMD} --installationkey ${KEY}" 
#     fi 
#     echo "Installing package ${PKG} ..." 
#     ${CMD} 
# done

echo "Done — UnofficialSF packages ready."









# # for loop example
# PACKAGES=("package1" "package2" "package3")
# for package in "${PACKAGES[@]}"; do
#     echo "Installing $package..."
#     # Command to install the package goes here
#     # e.g., sudo apt-get install "$package"
# done