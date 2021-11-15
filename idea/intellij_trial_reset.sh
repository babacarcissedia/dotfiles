#!/bin/bash

CONFIG_PATH=~/.config/JetBrains/IntelliJIdea2021.1
# Old config path : ~/.config/JetBrains/IntelliJIdea*
echo "removing evaluation key"
rm -rf "$CONFIG_PATH/eval"


echo "resetting evalsprt in options.xml"
sed -i '/evlsprt/d' "$CONFIG_PATH/options/options.xml"

echo "removing key"
rm "$CONFIG_PATH/idea*.key"


echo "resetting evalsprt in other.xml"
sed -i '/evlsprt/d' "$CONFIG_PATH/options/other.xml"

echo "resetting evalsprt in prefs.xml"
# sed -i '/evlsprt/d' ~/.java/.userPrefs/jetbrains/idea/prefs.xml
echo "just remove the whole directory java user prefs"
## Need to double check if there is anything inside that needs
##   to be taken care of. Example: google directory
## rm -fr ~/.java/.userPrefs

echo "Removing lock"
rm -fr ~/.java/.userPrefs/.user.lock*
echo "Removing prefs"
rm -fr ~/.java/.userPrefs/prefs.xml
rm -fr ~/.java/.userPrefs/jetbrains/prefs.xml

echo "Removing consent"
rm -rf ~/.local/share/JetBrains/consentOptions



echo "change date file"
find $CONFIG_PATH/* -type d -exec touch -t $(date +"%Y%m%d%H%M") {} +;
find $CONFIG_PATH/* -type f -exec touch -t $(date +"%Y%m%d%H%M") {} +;
