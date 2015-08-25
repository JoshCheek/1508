Initial Computer Setup
======================

**When you see a line that begins with a cash sign, `$`, that means that the command is to be run in the shell.**

Note to Josh from Josh
----------------------

For next time:

* Probably add linking instructions for other dotfiles as well: gitconfig, vimrc, ackrc, gemrc, gitignore, pryrc, rspec
* Maybe switch rspec to use what-we-have-here-is-an-error-to-communicate
* Maybe configure pryrc to use Atom

Bootstrap Bash
--------------

iTerm is a "terminal emulator" ie it pretends to be the ancient
shitty hardware that all our tools expect to run on.

* Download from [https://iterm2.com/](https://iterm2.com/)
* Once downloaded, open it so you can run the shell commands below.
* Make a bin directory to put programs into: `$ mkdir ~/bin`
* Make a code directory to put various projects and things into: `$ mkdir ~/code`
* Get all my configuration shit: `$ git clone https://github.com/JoshCheek/dotfiles-for-students.git ~/code/dotfiles`
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
Even if you don't intend to use it, install it,
we're going to run Seeing Is Believing from within it
(we'll talk about that below).

Download from [https://atom.io/](https://atom.io/).


Ruby
----

The programming language we will be using.
You can do this once homebrew is done installing chruby and ruby-install.
This could take a while, you can go install other things while this is going on.

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
  * In `Profiles -> Window`, set the columns to 120 and the rows to 40, so it's no so teeny tiny!
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
  * Now that they're installed, we can delete the code we downloaded:

    ```sh
    $ cd ..
    $ rm -r mbadolato-iTerm2-Color-Schemes-62d4247
    ```

Clone my 1508 repo
------------------

This is where I'm planning to put my various notes and more detailed plans than what will be on http://today.turing.io

```
$ git clone https://github.com/JoshCheek/1508.git ~/code/1508-echo
```

Seeing Is Believing
-------------------

Make sure you did the steps earlier where you installed the `seeing_is_believing` gem (in the [Ruby](#ruby) section).

### Config

Edit atom's configuration: `$ atom ~/.atom/config.cson`

You need to add this to the bottom of the configuration (replace YOURNAMEHERE with whatever `$ whoami` tells you)

```coffee
  'seeing-is-believing':
    'ruby-command':  '/Users/YOURNAMEHERE/code/dotfiles/bin/sib_ruby'
    'flags': [
      '--alignment-strategy', 'chunk',
      '--number-of-captures', '300',
      '--line-length',        '1000',
      '--timeout',            '12'
    ]
```

### Avoid this common error

IMPORTANT!! The indentation in this file matters, each level of indentation means that line is
scoped by the first line above it that has less indentation.
So you should have 2 spaces before `'seeing-is-believing'`,
which will mean that it is scoped by the first line, which looks like `'*':`
And notice that all the lines beneath `'seeing-is-believing'` are indented more than it,
which means that they are all scoped by it.

In other words, `'ruby-command'` is an option of `'seeing-is-believing'`,
which an option of `'*'` (asterisks are often used to imply "all" or "everything")

If the indentation is wrong, that will cause configuration to be located in the wrong spot,
and seeing is believing won't be able to find it.

### Install the plugin and run it

* Open up config: Command + comma
* Go to install
* Search for "seeing"
* Click "install"
* Open a new window (Command + N)
* Set the language to Ruby (Shift + Control + L), type "ruby", select it
* Type `1+1` in the document
* Try running Seeing Is Believing aginst it (this will probably fail) `Command + Option + b`
* If everything works, it will replace the line `1+1` with `1+1  # => 2`

### Troubleshooting

* If it prints a "∫" character, check that you have the `seeing_is_believing` package installed (this implies it didn't override the default keybindings).
* If gives you a red error message, complaining about your config.cson: Check the indentation of the keys in the file, check the sytax of the file (historically, it's almost always indentation).
* If it says it can't find `seeing_is_believing`
  * Check that SiB works outside of Atom: `$ seeing_is_believing -e '1+1'` if not, install it `gem install seeing_is_believing -v 3.0.0.beta.6`
  * Check that you have Atom configured to use the correct Ruby (in your ~/.atom/config.cson)
  * See what Atom is trying to run by pressing Command+Option+i, going to the console, and checking the logs (it will log the command, which you can then take to the shell).
    If that works in your shell, try running it without your shell's environment variables `$ env -i <WHATEVER-ATOM-RAN>`
* If it complains that it can't find chruby: Check that your `~/.bash_profile` is correctly linked and has the
  [code to load chruby](https://github.com/JoshCheek/dotfiles-for-students/blob/master/bash_profile#L8-L9) inside it.

Exercism
--------

### Download the program

Download the binary for exercism (choose the one for 64 bit mac) from
[https://github.com/exercism/cli/releases/latest](https://github.com/exercism/cli/releases/latest)

Move it into `~/bin`

### Find your API key

Sign up on the site: Click the login link, which will take you to GitHub, where you can authorize it.
Now find your API key by going to [http://exercism.io/account](http://exercism.io/account),
and clicking "settings". Copy that key.

### Configure it

```sh
$ exercism configure --key YOURKEYHERE --dir "$HOME/code/exercism"
```

### Run it

```sh
$ exercism demo
```

### Solve an exercism

Go to the challenge they downlaoded.

```sh
$ cd ~/code/exercism/ruby/hello-world/
total 32
-rw-r--r--  1    4.4K Aug 25 14:35 GETTING_STARTED.md
-rw-r--r--  1    2.7K Aug 25 14:35 README.md
-rw-r--r--  1    1.7K Aug 25 14:35 hello_world_test.rb
```

See it fail.

```sh
$ ruby hello_world_test.rb

Error:
hello_world_test.rb:5:in require_relative cannot load such file -- /Users/josh/code/exercism/ruby/hello-world/hello_world
...
```

Write the code to pass the tests.

```sh
$ echo  'class HelloWorld'\n'  def self.hello(name="World")'\n'    "Hello, #{name}!"'\n"  end"\n"end" > hello_world.rb

$ ruby hello_world_test.rb
Run options: --seed 16168

SS.S

Finished in 0.002207s, 1812.8011 runs/s, 453.2003 assertions/s.

4 runs, 1 assertions, 0 failures, 0 errors, 3 skips
```

Unskip the rest of the tests and see them pass.

```sh
$ ruby -i -ne 'print unless /skip/' hello_world_test.rb


# See all the tests pass
$ ruby hello_world_test.rb
Run options: --seed 33241

....

Finished in 0.001447s, 2764.2349 runs/s, 2764.2349 assertions/s.

4 runs, 4 assertions, 0 failures, 0 errors, 0 skips
```

### Submit the exercism

Lets submit the solution for the Ruby hello_world problem we solved above.

```sh
$ exercism submit hello_world.rb

Submitted Hello World in Ruby.
Your submission can be found online at http://exercism.io/submissions/44b34bdcfcec4725b05837e2a22b6a5f

To get the next exercise, run "exercism fetch" again.
```

We can grab the URL it printed ([http://exercism.io/submissions/44b34bdcfcec4725b05837e2a22b6a5f](http://exercism.io/submissions/44b34bdcfcec4725b05837e2a22b6a5f))
and go there to see that it is submitted:

```sh
$ open http://exercism.io/submissions/44b34bdcfcec4725b05837e2a22b6a5f
```

And now lets get the next one:

```sh
$ exercism fetch ruby
```

(I'm not sure what the output is, I solved a bunch of them a while back, so my output is likely different than yours)
