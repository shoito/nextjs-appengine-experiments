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