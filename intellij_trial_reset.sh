#!/bin/bash

echo "removing evaluation key"
rm  -rf ~/.IntelliJIdea*/config/eval

echo "resetting evalsprt in options.xml"
sed -i '/evlsprt/d' ~/.IntelliJIdea*/config/options/options.xml

echo "removing key"
sed -i '/evlsprt/d' ~/.IntelliJIdea*/config/idea13.key

echo "resetting evalsprt in other.xml"
sed -i '/evlsprt/d' ~/.IntelliJIdea*/config/options/other.xml

echo "resetting evalsprt in prefs.xml"
# sed -i '/evlsprt/d' ~/.java/.userPrefs/jetbrains/idea/prefs.xml
echo "just remove the whole directory java user prefs"
rm -fr ~/.java/.userPrefs/jetbrains/idea

echo "change date file"
find ~/.IntelliJIdea* -type d -exec touch -t $(date +"%Y%m%d%H%M") {} +;
find ~/.IntelliJIdea* -type f -exec touch -t $(date +"%Y%m%d%H%M") {} +;
