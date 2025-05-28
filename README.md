# bfb_delivery_desktop
Desktop GUI for bfb_delivery tool.


## Dev setup

Before you start developing, you need some one-time setups.

You need ``node.js`` installed. You can install it directly from the Node.js page, or you can use Homebrew if you have that installed:

```bash
    brew install node
```

You also need ``volta`` for version control. Again, you can install from the homepage, or use Homebrew:

```bash
    brew install volta
```

## Dev workflow

To try out your local version, install the app from the project files:

```bash
    npm install
```

To open the app from your local project files, run:

```bash
    npm start
```

To build the app and install it locally, run:

```bash
    npm run dist
```

Once the build completes, the installation file will be in the ``dist/`` folder. For a Mac, it will be a ``.dmg`` file, for Windows a ``.exe``, and a ``.AppImage`` file for Linux. Just run the file as you would for any downloaded app-installation file on your machine.