# Automatic package upgrades every sunday midnight
0 0 * * 0 root (apt-get update && apt-get -y -d upgrade) > /dev/null
