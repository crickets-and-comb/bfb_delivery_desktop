# bfb_delivery_desktop

Desktop GUI for bfb_delivery tool.

## Dev setup

Before you start developing, you need some one-time setups.

### Install volta

You need `node.js` installed, but you need to control your versions for different packages. We use `volta` for that. Install it directly, so you don't get shadowed versions interfering from installing with another tool like `homebrew` for instance. Visit [https://docs.volta.sh/guide/getting-started](https://docs.volta.sh/guide/getting-started) for installation instructions.

### Install node and npm

Then use volta to install `node` and `npm`:

```bash
    volta install node
    volta install npm
```

Doublecheck you're using the volta installations of these:

```bash
    which node
    which npm
```

If the paths returned are not under the `.volta` folder, then you may need to uninstall other installations and/or move the volta installations to the beginning of your PATH.

You can also check the versions you've installed, but if installed correctly, once you start your dev workflow (next section) by running `npm install` from within the project root, you should be running with the versions pinned in the `project.json` file.

## Dev workflow

Assuming you've cloned the repo and are working from within its root folder, there are a number of commands you can use to try out your project files and new features.

Start by installing the app from the project files:

```bash
    npm install
```

To open the app from your local project files, run:

```bash
    npm start
```

To build the app and install it locally, first run:

```bash
    npm run dist
```

Then, once the build completes, it will have created a `dist/` folder in your project files if it didn't already exist, and the installation file will be in there. For a Mac, it will be a `.dmg` file, for Windows a `.exe`, and a `.AppImage` file for Linux. Just run the file as you would for any downloaded app-installation file on your machine.

### QC before commits

Before committing, or at the very least before pushing to a PR, you need to run the built-in QC tools.

#### Format and lint

To be sure your code is properly formatted to adhere to our conventions, run the formatter and the linter before making commits:

```bash
    npm run format
    npm run lint
```

Format will edit the code to meet our conventions, while lint will check and fail if the code does not meet conventions. Release builds and PR builds run lint without running format, so you want to be sure you've formatted before opening PRs or pushing to them.

#### Security check

To check for dependency vulnerabilities and environment issues, run the security script:

```bash
    npm run security
```
