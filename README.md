# bfb_delivery_desktop
Desktop GUI for bfb_delivery tool.


## Dev setup

You need ``node.js`` installed, and to install that, you need to install [homebrew](https://docs.brew.sh/Installation). Once Homebrew is installed, install ``node.js``:

```bash
    brew install node
```

You also need ``nvm`` for version control:

```bash
    brew install nvm
```

Then, update your shell profile, typically following the instructions printed at the end of the installation output:

"""
You should create NVM's working directory if it doesn't exist:
  mkdir ~/.nvm

Add the following to your shell profile e.g. ~/.profile or ~/.zshrc:
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

You can set $NVM_DIR to any location, but leaving it unchanged from
/opt/homebrew/Cellar/nvm/0.40.3 will destroy any nvm-installed Node installations
upon upgrade/reinstall.

Type `nvm help` for further information.
"""

In my case, I added this to ``~/.bash_profile``.