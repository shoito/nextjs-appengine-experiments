#!/bin/bash

WORKING_DIRECTORY=apps/web

cat <<EOF > .npmrc
node-linker=hoisted
EOF

pnpm install --frozen-lockfile
pnpm build
cd $WORKING_DIRECTORY

mv .next _next
cp -rf _next/standalone/$WORKING_DIRECTORY/. .
cp -rf _next/standalone/node_modules/. ./node_modules
cp -rf _next/static .next/
rm -rf _next
cat <<EOF > pnpm-lock.yaml
lockfileVersion: '6.0'
EOF

tar --exclude node_modules/.pnpm --exclude node_modules/.bin -zcvf node_modules.tar.gz node_modules
jq 'del(.dependencies, .devDependencies, .optionalDependencies)' package.json > package.json.tmp && mv package.json.tmp package.json
jq 'del(.scripts.start)' package.json > package.json.tmp && mv package.json.tmp package.json
