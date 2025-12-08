# Start script in terminal
# $ ./scripts/UnofficialSf/installUnofficialSfPackages.sh

set -e

DEVHUB_ALIAS="DevHub_Dev"
SCRATCH_ALIAS="ScratchOrg_Scr"
SCRATCH_DEF="config/project-scratch-def.json"
DURATION_DAYS=30

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

echo "Done — UnofficialSF packages ready."