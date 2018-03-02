#!/bin/bash
git init temporary
cd temporary
git remote add origin $GIT_URL
git config core.sparsecheckout true
IFS=',' read -ra ADDR <<< "${PATHS}"
for i in "${ADDR[@]}"; do
      echo $i >> .git/info/sparse-checkout
done
git pull --depth=1 origin $GIT_BRANCH
cd ..
rm -r .git
zip -r $NAME.zip temporary
rm -r temporary
echo "To retrieve the folder use docker cp $(cat /etc/hostname):$NAME.zip $NAME.zip"
