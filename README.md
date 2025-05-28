# bfb_delivery_desktop

Desktop GUI for bfb_delivery tool.

UNDER CONSTRUCTION!!

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

### Potential first step in each terminal session

When using VS Code's terminal, for instance, there may be additional items added to the `$PATH` in front of `volta`'s binaries, and those may include `node` or `npm` installations that shadow your volta-versioned installations. This will be a problem. If you have this problem, and you're running a Mac, one solution is to add an export to your bash/zsh profile that puts volta back at the front of the path (per Volta's offical installation instructions linked above), and source this profile again every time you open a terminal in VS Code or whatever IDE is causing this issue.

### Install playwright browsers

You need these to run tests.

```bash
    npx playwright install
```

## Dev workflow

Assuming you've cloned the repo and are working from within its root folder, there are a number of commands you can use to try out your project files and new features.

### Install dependencies

Start by installing the dependencies from the project files:

```bash
    npm ci
```

This uses the `package-lock.json` to install exact versions. This is ostensibly what was used when last merged to main.

That's a good place to start, but it is recommended to look for updates.

If you want to install dependencies with any available updates while avoiding breaking changes, run this:

```bash
    npm install
```

This will install dependencies using the looser semantic versioning pins in `package.json`. If new minor or patch updates are installed, it will update the `package-lock.json` file.

#### Run app

To run the app from your local project files, run:

```bash
    npm start
```

To build the app and install it, instead of running from your project files, first run:

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

#### Run tests

Now you're ready to run tests. You should write tests for each feature you implement, as others before you have. For every change you make, make sure all existing tests still pass:

```bash
    npm run test
```

This runs all the tests under the `tests/` directory.

#### Try the app

It never hurts to try the app out yourself again. Run it from the project files first then rebuild the dist and reinstall on your machine, as outlined in the beginning.

### QC before pushing

You should do a comprehensive rebuild and test before pushing to a PR. We need to save resources and be confident our changes will not fail builds on GitHub.

#### Run the full QC suite

Run the full QC suite from install to test to dist build:

```bash
    npm run full
```

Then install and open the distribution you just built, and give it a try.

#### Run the GitHub workflow

You can run the GitHub Actions workflow using `act`. You'll need to [install act](https://nektosact.com/installation/) and [Docker](https://docs.docker.com/engine/install/) to do that, and have Docker running.

Then, run it:

```bash
    npm run act
```

This will run the entire QC workflow outlined above from the workflow in `.github/workflows`. This is a good way to test the workflow itself and be confident your PR will pass on GitHub.

That said, watch out because it will not run GUI tests, and this is a GUI project. So, it's always good to try the running the app from the project files and the dist, as outlined in the beginning.
