# Start script in terminal
# $ scripts/UnofficialSf/installUnofficialSfPackages.sh



set -e
#Говорит bash немедленно завершить выполнение скрипта, если любая команда возвращает ненулевой код ошибки.
# В терминале каждая команда возвращает exit code:
#   0 — команда выполнилась успешно
#   любое другое число — произошла ошибка
# Без set -e скрипт продолжит выполняться, даже если какая-то команда упала, что может привести к непредсказуемым последствиям.


PACKAGES=("package1" "package2" "package3")
for package in "${PACKAGES[@]}"; do
    echo "Installing $package..."
    # Command to install the package goes here
    # e.g., sudo apt-get install "$package"
done