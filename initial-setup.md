Initial Computer Setup
======================

**When you see a line that begins with a cash sign, `$`, that means that the command is to be run in the shell.**

Bootstrap iTerm
---------------

This is a "terminal emulator" ie it pretends to be the ancient
shitty hardware that all our tools expect to run on.

* Download from [https://iterm2.com/](https://iterm2.com/)
* Make a bin directory to put programs into: `$ mkdir ~/bin`
* Make a code directory to put various projects and things into: `$ mkdir ~/code`
* Get all my configuration shit: `git clone git@github.com:JoshCheek/dotfiles-for-students.git ~/code/dotfiles`
* Get a not shitty bash profile (note: If you've customized your bash profile, you'll need to consolidate the two...
  don't run the command below, it will blow away your changes. If you don't know whether you have, then you haven't, you're fine.
  `$ ln -s "$HOME/code/dotfiles/bash_profile" "$HOME/.bash_profile"`
* Close the window and open a new one, you should see colour.
* Make the directory we'll need for the shell we're going to use

  ```ruby
  $ mkdir ~/.config
  $ ln -s "$HOME/code/dotfiles/fish" "$HOME/.config/fish"
  ```

Make your computer not annoyingly slow
---------------------------------------

* Go to the  (upper left corner) -> System Preferences -> Keyboard
* Set "Key Repeat" all the way to "Fast"
* Set "Delay Until Repeat" all the way to "Short"
* Within "Modifier Keys", change Caps Lock to be Control

Homebrew
--------

Install Homebrew (handles complex installation of other stuff)
It will probably prompt you to install something like `xcode-select` or `xcrun` or some shit, accept this.

```sh
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install other stuff (you can go do other things while this is going on)

```sh
$ brew install fish chruby ruby-install chruby-fish ack git ag tree
```


What are those things we're installing?

* fish         - The shell I use
* ruby-install - Installs rubies
* chruby       - Allows you to change between rubies
* chruby-fish  - Allows fish shell to use chruby
* ag           - My preferred file searcher
* ack          - a reasonably decent file searcher (better than grep)
* git          - Tracks changes to code and eases collaboration
* tree         - Prints out directories in a visual manner


Atom
----

A reasonably decent text editor.
Even if you don't intend to use it, install it, I built a tool for it.

Download from [https://atom.io/](https://atom.io/).


Ruby
----

The programming language we will be using.

Once the homebrew stuff is finished.
You can go do other things while this is going on.

```
$ ruby-install ruby 2.2.2
$ chruby 2.2.2
$ gem install seeing_is_believing -v 3.0.0.beta.6
$ gem install pry
```


Better Iterm
------------

* Some better preferences.
  * Get to the preferences with Command + comma
  * Set the shell to fish `Profiles -> General -> Command: /usr/local/bin/fish`
  * Make your left option key useful `Profiles -> General -> Keys -> Left option acts as: +Esc`
  * Window size is independent of text size `General -> Adjust window when changing font size: off`
* Themes:
  * Get the list of nice themes
    `$ curl -L 'https://github.com/mbadolato/iTerm2-Color-Schemes/tarball/master' | tar -x`
  * Launch iTerm 2.
  * Type CMD+i (⌘+i)
  * Navigate to Colors tab
  * Click on Load Presets
  * Click on Import
  * Navigate to mbadolato-iTerm2-Color-Schemes-62d4247/schemes
  * Click the first scheme
  * Hold shift and click the last scheme
  * Click the "Open" button.
  * Click on Load Presets
  * Choose "Solarized Dark Higher Contrast" (you can play with the others, but default to this one)

Clone my 1508 repo
------------------

This is where I'm planning to put my various notes and more detailed plans than what will be on http://today.turing.io

```
$ git clone git@github.com:JoshCheek/1508.git ~/code/1508-echo
```

Exercism
--------

Download the latest exercism binary from [https://github.com/exercism/cli/releases/latest](https://github.com/exercism/cli/releases/latest)

Move it into `~/bin`
Make sure you can run it:

```sh
$ exercism demo
```
