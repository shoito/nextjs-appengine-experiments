#!/bin/bash

rm -rf dist .next
mkdir dist
# Build Next.js app for standalone deployment
npm ci && npm run build
cp -rf .next/standalone/. dist/
cp -rf .next/static/. dist/.next/static/
cp -rf public/. dist/public/
# Copy app.yaml for App Engine
cp app.yaml .gcloudignore package*.json dist/
# Change directory to dist for gcloud app deploy command
cd dist
# Archive node_modules for skipping npm install on App Engine
tar -zcvf node_modules.tar.gz node_modules
# Remove dependencies from package.json for skipping npm install on App Engine with jq command
jq 'del(.dependencies)' package.json > package.json.tmp && mv package.json.tmp package.json
jq 'del(.devDependencies)' package.json > package.json.tmp && mv package.json.tmp package.json
jq 'del(.optionalDependencies)' package.json > package.json.tmp && mv package.json.tmp package.json
# Remove scripts from package.json for skipping npm run start on App Engine with jq command
jq 'del(.scripts.start)' package.json > package.json.tmp && mv package.json.tmp package.json

# Inject warmup endpoint to server.js
awk '{
  if ($0=="      await nextHandler(req, res)") {
    print "      if (req.url === \"/_ah/warmup\" && req.method === \"GET\") {"
    print "        res.statusCode = 200"
    print "        res.end(\"\")"
    print "        return"
    print "      }"
  }
  print
}' server.js > tmp && mv tmp server.js
