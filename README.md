# TypeScript Node Starter

[![Dependency Status](https://david-dm.org/Microsoft/TypeScript-Node-Starter.svg)](https://david-dm.org/Microsoft/TypeScript-Node-Starter) [![Build Status](https://travis-ci.org/Microsoft/TypeScript-Node-Starter.svg?branch=master)](https://travis-ci.org/Microsoft/TypeScript-Node-Starter)

**Live Demo**: [https://typescript-node-starter.azurewebsites.net/](https://typescript-node-starter.azurewebsites.net/)

![image](https://user-images.githubusercontent.com/820883/36764267-abbdb7f8-1be0-11e8-9678-2a9ea448d7f8.png)

The main purpose of this repository is to show a good end-to-end project setup and workflow for writing Node code in TypeScript.
We will try to keep this as up-to-date as possible, but community contributions and recommendations for improvements are encouraged and will be most welcome.

# Table of contents:

- [Pre-reqs](#pre-reqs)
- [Getting started](#getting-started)
- [Deploying the app](#deploying-the-app)
	- [Pre-reqs](#pre-reqs-1)
	- [Deploying to Amazon web services](#deploying-to-amazon-web-services)

# Pre-reqs
To build and run this app locally you will need a few things:
- Install [Docker](https://docs.docker.com/install/)

# Getting started
- Clone the repository
```
git clone --depth=1 https://github.com/Microsoft/TypeScript-Node-Starter.git <project_name>
```
- Start Docker containers
```
cd <project_name>
make start
```

Finally, navigate to `http://0.0.0.0:3000` and you should see the template being served and rendered locally!

# Deploying the app
There are many ways to deploy an Node app, and in general, nothing about the deployment process changes because you're using TypeScript.
In this section, I'll walk you through how to deploy this app to Amazon Web Services using terraform.

## Prerequisites
- [**AWS account**](https://console.aws.amazon.com) - If you don't have one, you can sign up for free.

- **Create a cloud database** -
For local development, running MongoDB on localhost is fine, however once we deploy we need a database with high availability.
The easiest way to achieve this is by using a managed cloud database.
There are many different providers, but the easiest one to get started with is [MongoLab](#mlab).

### <a name="mlab"></a> Create a managed MongoDB with MongoLab
1. Navigate to [MongoLab's Website](https://mlab.com/), sign up for a free account, and then log in.
2. In the **MongoDB Deployments** section, click the **Create New** button.
3. Select any provider (I recommend **Microsoft Azure** as it provides an easier path to upgrading to globally distributed instances later).
4. Select **Sandbox** to keep it free unless you know what you're doing, and hit **Continue**.
5. Select a region (I recommend the region geographically closest to your app's users).
6. Add a name, click **Continue** again, and finally **Submit Order**.
7. Once your new database is created, select it from the **MongoDB Deployments** section.
8. Create a user by selecting the **User** tab, clicking the **Add database user** button, adding a username and password, and then clicking **Create**.
A user account is required to connect to the database, so remember these values because you will need them as part of your connection string.
9. Copy the connection string from the top of the page, it should look like this: `mongodb://<dbuser>:<dbpassword>@ds036069.mlab.com:36069/test-asdf`
and replace `<dbUser>` and `<dbpassword>` with the credentials you just created.
Back in your project, open your `.env` file and update `MONGODB_URI` with your new connection string.
    > NOTE! - If you don't have an `.env` file yet, rename `.env.example` to `.env` and follow the comments to update the values in that file.
10. **Success!**
You can test that it works locally by updating `MONGODB_URI_LOCAL` to the same connection string you just updated in `MONGO_URI`.
After rebuilding/serving, the app should work, but users that were previously created in local testing will not exist in the new database!
Don't forget to return the `MONGO_URI_LOCAL` to your local test database (if you so desire).
11. Make sure to **allow connection from anywhere** to the datbase you just created.


## Deploying to Amazon Web Services
Visit https://github.com/primuse/Typescript_starter_deployment_scripts#building-and-running-the-application for steps to deploy.

