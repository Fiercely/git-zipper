#!/bin/bash
git init $NAME
cd $NAME
git remote add origin $GIT_URL
git config core.sparsecheckout true
IFS=',' read -ra ADDR <<< "${PATHS}"
for i in "${ADDR[@]}"; do
      echo $i >> .git/info/sparse-checkout
done
git pull --depth=1 origin $GIT_BRANCH
cd ..
zip -r $NAME.zip $NAME -x *.git*
rm -r $NAME
GREEN='\033[0;32m'
NC='\033[0m'
printf "To retrieve the folder use\n ${GREEN}docker cp $(cat /etc/hostname):$NAME.zip $NAME.zip${NC}\n"
