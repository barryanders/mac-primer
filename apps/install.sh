#!/usr/bin/env bash

echo 'Installing apps…'
cd ~//apps/
chmod +x *.sh

# Brew: The missing package manager for macOS | https://github.com/Homebrew/brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap "homebrew/bundle"
brew bundle
brew cleanup
brew doctor

# Make brew work
eval $(/opt/homebrew/bin/brew shellenv)

# Switch to using brew-installed bash as default shell
BREW_PREFIX=$(brew --prefix) # Homebrew's installed location
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# npm: a JavaScript package manager | https://github.com/npm/cli
for i in $(cat npmfile); do
  npm install -g $i
done
wait
