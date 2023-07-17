# Next.js on Google App Engine Experiments

This is a repository for my experiments with Next.js on Google App Engine.

## Prerequisites

- [Node.js](https://nodejs.org/en/)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

## Commands

create a new Next.js project.

```sh
$ npx create-next-app
Need to install the following packages:
  create-next-app@13.4.10
Ok to proceed? (y) 
✔ What is your project named? … nextjs-appengine-initial-setup
✔ Would you like to use TypeScript? … No / Yes
✔ Would you like to use ESLint? … No / Yes
✔ Would you like to use Tailwind CSS? … No / Yes
✔ Would you like to use `src/` directory? … No / Yes
✔ Would you like to use App Router? (recommended) … No / Yes
✔ Would you like to customize the default import alias? … No / Yes
Creating a new Next.js app in ~/Workspaces/nextjs-appengine-experiments/nextjs-appengine-initial-setup.

Using npm.

Initializing project with template: app-tw 


Installing dependencies:
- react
- react-dom
- next
- typescript
- @types/react
- @types/node
- @types/react-dom
- tailwindcss
- postcss
- autoprefixer
- eslint
- eslint-config-next


added 350 packages, and audited 351 packages in 36s

131 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
Initialized a git repository.

Success! Created nextjs-appengine-initial-setup at ~/Workspaces/nextjs-appengine-experiments/nextjs-appengine-initial-setup
```

Run the development server on local.

```sh
$ npm install

added 350 packages, and audited 351 packages in 5s

131 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
(base) ~/Workspaces/nextjs-appengine-experiments/nextjs-appengine-initial-setup (main)
$ npm run dev

> nextjs-appengine-initial-setup@0.1.0 dev
> next dev

- ready started server on 0.0.0.0:3000, url: http://localhost:3000
- event compiled client and server successfully in 113 ms (20 modules)
```

Create a new project on Google Cloud Platform.

```sh
$ gcloud projects create xxxxx
$ gcloud config set project xxxxx
$ gcloud app create --region asia-northeast1
```

Create `app.yaml` file.

```sh
$ cat <<EOF > app.yaml
runtime: nodejs20
instance_class: F1
service: default
EOF
```

Deploy to Google App Engine.

```sh
$ gcloud app deploy
```

View the app in your web browser.

```sh
$ gcloud app browse
```
