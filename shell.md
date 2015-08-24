Shell
-----

The shell is a program that runs in your terminal, yours is called `fish`.
Ruby is another example of a program that runs in the terminal.
The shell is interactive, its purpose is to allow you to move around your computer,
run programs, work with files, etc.


* Indicated in documents with a dollar sign `$ something` means to go to the shell and type "something" and hit return.
  We see this in the enigma documentation,
  [http://tutorials.jumpstartlab.com/projects/enigma.html](http://tutorials.jumpstartlab.com/projects/enigma.html)
  where it says `$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415`
* "No output" typically means success. So if you run a command and don't see anything, it probably means that it succeeded.
  But, just to make it easier to notice these things, the prompt will change if a command succeeds (a fish), or fails (a sushi :P)
  Try it out, here is a program that always fails: `$ false` and here is a program that always succeeds: `$ true` Try running them!
* Directories (aka folders are containers for other directories and files)
  * See the current directory with `$ pwd`
  * I also gave you a program, `$ fullpath .` which will print the "full path" to some location. It's very similar to `$ pwd`,
    except it accepts a path as an argument, and then expands it.
  * I've also got it listed in the middle block.
  * Move between directories with `cd` I've modified our `cd` command to do an `$ l` after it runs,
    so that we can see what's in the directory every time we change it.
  * `~`  - your home directory (where all of your files are on your computer)
  * `/`  - the "root", toplevel directory of the whole computer.
    When you see something like `/Users/josh`, that first slash is the root.
    Try doing `$ pwd`, you'll see the "path" through the directory structure from the root to wherever you currently are.
  * `.`  - the current directory (this is why people do `git add .`, because it means "add everything in my current directory")
  * `..` - the parent directory (this is why people do `cd ..`, because they want to go to the parent directory.
  * Everything else: a directory that is relative to the current directory.

### Kata: Navigation

Try navigating to some directories:

[https://s3.amazonaws.com/josh.cheek/screencasts/rachel/file-system1.mp4](https://s3.amazonaws.com/josh.cheek/screencasts/rachel/file-system1.mp4)

```
# go to the home directory
$ cd ~

# what is the path from the root to my home directory?
$ pwd
/Users/josh

# go to the root directory and then get back to the home directory by following the path
$ cd /
$ pwd
/
$ cd Users
$ pwd
/Users
$ cd josh

# Notice that the second pink block, which says our directory, says `~` instead of `/Users/josh`
# That's because they're two different ways to talk about the same thing, but I think of it as my home directory :)
$ pwd
/Users/josh
```

### Kata:

[https://s3.amazonaws.com/josh.cheek/screencasts/rachel/file-system2.mp4](https://s3.amazonaws.com/josh.cheek/screencasts/rachel/file-system2.mp4)

* Go to the root of your computer, moving one directory at a time, get to your home directory, and then back to the root (that's the parent of the parent of your current directory)
* Cd to the current directory
* Anticipate what each of these will print (replace my username with yours) Use the up arrow to get to the previous line,
  and then amend it. Once you are able to anticipate what each of these will print, come up with a way to `$ cd` into the
  directory you are currently in, that has 20 segments in the path.
  ```
  $ cd ~
  $ fullpath ..
  $ fullpath ../..
  $ fullpath Desktop
  $ fullpath Desktop/..
  $ fullpath Desktop/../..
  $ fullpath Desktop/../../..
  $ fullpath Desktop/../../../Users
  $ fullpath Desktop/../../../Users/josh
  $ fullpath Desktop/../../../Users/josh/Desktop
  $ fullpath Desktop/../../../Users/josh/Desktop/..
  $ fullpath Desktop/../../../Users/josh/Desktop/../.
  $ fullpath Desktop/../../../Users/josh/Desktop/.././.
  $ fullpath Desktop/../../../Users/josh/Desktop/../././.
  $ fullpath Desktop/../../../Users/josh/Desktop/.././././.

  $ cd /
  $ fullpath ~
  $ fullpath ~/Desktop
  $ fullpath ~/Desktop/.
  $ fullpath ~/Desktop/./.
  $ fullpath ~/Desktop/././..
  $ fullpath ~/Desktop/././../..
  $ fullpath ~/Desktop/././../../..
  ```

How the shell makes sense of what you type
------------------------------------------

* The shell takes a string you typed, splits it on spaces
* It considers the first word to be a program
* and the remaining words to be arguments to the program
* example: `$ ruby lib/encrypt.rb input.txt output.txt`,
  you can see this as `['ruby', 'lib/encrypt.rb', 'input.txt', 'output.txt']`
  And so the program we execute will be `ruby`, and it's receiving the remaining three things as arguments.
* example: `$ ls -l` so the program is `ls` and it's receiving `['-l']` as arguments.
* Arguments don't inherently have any meaning, the prgram gets to decide what it wants to do with them.
* files that begin with a dot (period) are not displayed in `ls` output by default,
  this is why most configuration files begin with a dot, and it's why most configuration files are called "dotfiles"
  there are a bunch in your home directory, you can see them with `$ ls -a ~` where `-a` stands for "all".

Useful programs
---------------

* `$ pwd`       - "Print Working Directory", where am I on the file system
* `$ cd abc`    - change directories to "abc", in the current directory (what if you had said `$ cd ./abc`?)
* `$ l`         - My fancy version of `$ ls`
* `$ show-argv` - A program I wrote to show you how your arguments got parsed and handed to the program.

### Kata:

```
$ show-argv a
$ show-argv a b c
$ show-argv a b cdefg
$ show-argv a b cdefg /
$ show-argv a b cdefg / "abc"
$ show-argv a b cdefg / "abc" abc-def_ghiJKL
$ show-argv a  b
$ show-argv abc                          def
```

Keybindings
-----------

```
How to read these keybindings
  C-something   # hold Control (your caps lock is rebound to control) and press the "something" key
  M-something   # hold Meta (this is a key that doesn't exist anymore, but I made your left option key work for it) and pres the "something" key

These work basically everywhere you can enter text in a mac
  C-a           # go to the beginning of the line
  C-e           # go to the end of the line
  C-k           # "kill" to the end of the line (like cut, but doesn't use the system pasteboard)
  C-y           # "yank" the previously killed text

Other useful ones
  M-delete        # delete the previous word
  M-f             # move forward a word
  M-b             # move backwards a word
  up              # go backward in history (whatever you typed in the previous command)
  down            # go forward in history (after moving back in history, this will be what you typed in the next command)
  C-f             # Accepts an autosuggestion (grayed out command that Fish displays as you type)
```

### Kata

[Example: https://s3.amazonaws.com/josh.cheek/screencasts/rachel/navigation.mp4](https://s3.amazonaws.com/josh.cheek/screencasts/rachel/navigation.mp4)

Randomly pound the keyboard for a bit.  Then go to the beginning of the line.
The end of the line. Kill the line. Yank the line. Kill. Yank. Beginning. Kill. End.
Back 1 word. Back 1 word. Forward 1 word. Forward 1 word. Beginning.
Forward a word until you are at the end. Delete the last word.
Back a word. Delete word. Back a word. End. Kill.

### Kata

Begin typing this command (it is intentionally misspelled... you'll notice fish highlights this red to let you know)

```
$ ccd ~/Desktop/../
```

Pretend you realize you need to run some other command to figure out how to complete it, lets say `$ ls`

* Kill the partially written command.
* Run ls.
* Yank the command.
* Go to the beginning of the line.
* Move forward a character.
* Delete the extra `c`.
* Go to the end of the line.
* Add `Downloads` to the end run it.
* You should now be in your `~/Downloads` folder.


Mac
---

```
Command-,    # (that's a comma) Open preferences
Command-w    # Close the window
Command-c    # copy
Command-v    # paste
Command-tab  # Switch between mac applications
Command-~    # Switch between windows of the same mac application
```
