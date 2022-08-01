# Mac Primer

I use **Mac Primer** to automatically set up my Mac. Feel free to use this as a base for your own setup.

## Overview

- [`apps`](#apps): Lists of installable packages
- [`dotfiles`](#dotfiles): Shell commands and configurations
- [`preferences`](#preferences): Presets for system preferences
- [`dock`](#dock): Customize your Dock
- [`hosts`](#hosts): Track your hosts

## [Apps](https://github.com/barryanders/mac-primer/tree/main/apps)

To install my apps all at once, I use [`brewfile`](https://github.com/barryanders/mac-primer/tree/main/apps/brewfile) (an installable list of apps generated by and for [Homebrew](https://github.com/Homebrew/brew)). I rely almost exclusively on Homebrew to manage and update my apps. [Learn how to make your own brewfile](https://github.com/Homebrew/homebrew-bundle).

### Install Apps

Run this script to install the packages listed in the [apps folder](https://github.com/barryanders/mac-primer/tree/main/apps).

```bash
~//apps/install.sh
```

### Update Apps

I use the [`update brew`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/update) command to keep my apps updated.

## [Dotfiles](https://github.com/barryanders/mac-primer/tree/main/dotfiles)

To customize my command line experience, I keep a set of configurations known as [dotfiles](https://dotfiles.github.io/).

### Install Dotfiles

 The [dotfiles installer](https://github.com/barryanders/mac-primer/blob/main/dotfiles/install.sh) requires [`stow`](https://www.gnu.org/software/stow/) ([`brew install stow`](https://formulae.brew.sh/formula/stow)). Run this script to link the files in the [`dotfiles` folder](https://github.com/barryanders/mac-primer/tree/main/dotfiles) to your `$HOME` folder.

```bash
~//dotfiles/install.sh
```

### Update Dotfiles

The dotfiles are live because they are linked to your `$HOME` folder, but you may need to start a new CLI session for your changes to take effect (I use the [`reload`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/$) command). As you add or remove files, simply rerun the installer to sync your changes. Dead links get removed and new links get added. I use the [`update dotfiles`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/update) command to relink mine.

### Customize Dotfiles

#### [`.commands` Folder](https://github.com/barryanders/mac-primer/tree/main/dotfiles/.commands)

The [`.commands` folder](https://github.com/barryanders/mac-primer/tree/main/dotfiles/.commands) is intended for you to add and remove custom commands in a categorical way. Keep what you want. Refer to the [`template` file](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/template) for a basic example of how to create your own commands.

Here's what I've got in there for you:

- [`$`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/%24): Reasonable Terminal defaults
- [`clean`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/clean): System maintenance
- [`dock`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/dock): Control your Dock
- [`download`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/download): Download links, music, and videos
- [`finder`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/finder): View files, get info, perform actions, extract, compress, etc.
- [`images`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/images): Batch resizing images
- [`mac`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/mac): A CLI for macOS - ex. Bluetooth, Spotlight, Wi-Fi, Gatekeeper
- [`network`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/network): Get IP addresses and flush your dns
- [`ringtone`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/ringtone): Turn any mp3 into a ringtone for your phone
- [`text`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/text): Format text and encode/decode in base64, binary, hex, md5, and sha1
- [`update`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/update): Update all the things
- [`video`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/video): Remux, encode, or merge videos

#### [`.path` File](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.path)

Append to the `$PATH`. Here's an example `.path` file that adds `/usr/local/bin` to the `$PATH`.

```bash
export PATH="/usr/local/bin:$PATH"
```

#### `.private` File

Add private code that you don't want to commit to a public repository. My `.private` file looks something like this.

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
# https://help.github.com/articles/generating-a-gpg-key/
# Use "gpg --full-generate-key" for a full featured key generation dialog
GIT_AUTHOR_NAME="Username"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="username@users.noreply.github.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
# Use "gpg --list-secret-keys --keyid-format LONG" to find the signing key
# For users with 2 factor authentication enabled: if git asks you to sign in, use an access token as your password
# Get an access token here: https://github.com/settings/tokens
GIT_SIGNING_KEY="starwarsissocool"
git config --global user.signingkey "$GIT_SIGNING_KEY"
```

#### Other Dotfiles

There are some other dotfiles included like [`.hushlogin`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.hushlogin), [`.wgetrc`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.wgetrc), and [`.gitconfig`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.gitconfig).

## Preferences

Use [`preferences`](https://github.com/barryanders/mac-primer/blob/main/preferences) to make adjustments you would otherwise set in the System Preferences app. Define this file and reuse it whenever you like. If your settings ever get messed up, this is a great way to restore them.

```bash
~//preferences
```

## Dock

Customize your Dock with the [`dock` file](https://github.com/barryanders/mac-primer/blob/main/dock). Use these commands:

- `dock add "Terminal"`: Add an application to the macOS Dock
- `dock add:spacer`: Adds an empty space to macOS Dock
- `dock clear`: Removes all persistent icons from macOS Dock
- `dock reset`: Reset macOS Dock to default settings

Once you're done, run the [`dock` file](https://github.com/barryanders/mac-primer/blob/main/dock) and your Dock will be updated accordingly.

```bash
~//dock
```

## [Hosts](https://github.com/barryanders/mac-primer/blob/main/hosts)

Keep track of your hosts in the [`hosts` file](https://github.com/barryanders/mac-primer/blob/main/hosts). I use [`update hosts`](https://github.com/barryanders/mac-primer/blob/main/dotfiles/.commands/update) to replace my system hosts file with this one.

## One-line Install

You can install everything with this one-liner.

```bash
git clone https://github.com/barryanders/mac-primer.git ~/ && ~//primer.sh
```

## Author

<table>
  <thead>
    <tr>
      <th valign="middle" align="center">
        <a href="https://barryanders.github.io"><img alt="Barry Anders" src="https://avatars.githubusercontent.com/u/91902180?v=4&s=200" width="100" height="100"></a>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td valign="middle" align="center">
        <a href="https://barryanders.github.io"><strong>Barry Anders</strong></a>
      </td>
    </tr>
  </tbody>
</table>
