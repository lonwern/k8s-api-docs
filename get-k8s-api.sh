#!/bin/bash

export K8S_API_VERSION=$1
export K8S_API_DOMAIN=kubernetes.io
export K8S_API_PATH=docs/reference/generated/kubernetes-api/v$K8S_API_VERSION/
export K8S_API_URL=$K8S_API_DOMAIN/$K8S_API_PATH

if grep -Fq "v$K8S_API_VERSION" ./$K8S_API_DOMAIN/index.html ; then
  echo "$K8S_API_VERSION already exists"
  exit 1
fi

wget -r -p https://$K8S_API_URL

for f in $(find ./$K8S_API_URL -type f); do
  if [ $f = ${f%%\?*} ]; then continue; fi
  mv "${f}" "${f%%\?*}"
done

sed -i "s/<!-- REPLACE_MARK -->/<!-- REPLACE_MARK -->\n    <li><a href=\"docs\/reference\/generated\/kubernetes-api\/v$K8S_API_VERSION\/\">$K8S_API_VERSION<\/a><\/li>/g" ./$K8S_API_DOMAIN/index.html
