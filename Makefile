.PHONY: install

# TODO: This command only works on macOS with Homebrew installed. It would be better to somehow detect the OS and installation location and use that so it can run on Windows, Linux, and Mac without Homebrew. Once we do that, we should update the dev setup instructions to include other Node.js installations besides through Homebrew.
install:
	bash -c 'export NVM_DIR="$$HOME/.nvm"; \
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"; \
  nvm use || nvm install;'
	npm install