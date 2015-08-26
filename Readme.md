1508
====

23 - 29 Aug
-----------

* 24 Aug
  *  8:30 Staff introduction
  *  9:00 Tour and getting started
  *  9:30 Building Turing
  * 12:00 Student Introduction / Lunch
  *  1:00 Success at Turing
  -  2:00 (Echo) Tooling setup
    * https://github.com/JoshCheek/1508/blob/master/initial-setup.md
  -  3:00 (Echo) Getting started with Exercism
  * (Echo) Homework:
    * [Shell](https://github.com/JoshCheek/1508/blob/master/shell.md)
      - Read this whole document
      - Memorize the keybindings for the shell
      - Memorize the keybindings for the Mac
      - You will know you have memorized them sufficiently when you can perform them from memory
      - It would be good for you to go through the katas, as well, but not necessary
    - Read about hard / soft skills in The Little Book of Talent
      - Chapter 7: Before you start, figure out if it's a hard skill or a soft skill
      - Chapter 8: To build hard skills, work like a careful carpenter
      - Write a paragraph about each, describing what it would look like to apply these skills to your time here at Turing
    - [Superfizz](https://github.com/turingschool/challenges/blob/master/super_fizz.markdown)
* 25 Aug
  - 8:30 (Echo) continue from yesterday... (we got preempted by posse time >.<)

    [This form](https://docs.google.com/forms/d/1KSt9ZFppCPeCfhaakI6nEkJ12lO6vknhnw2RWUJvwD8/viewform)
    should be completed.

    You should all be invited to the 1508-echo channel on Slack... if not, tell Josh.

    Pull changes since yesterday:

    ```
    $ cd ~/code/dotfiles
    $ git pull

    $ cd ../1508-echo
    $ git pull
    ```

    [Continue from yesterday](https://github.com/JoshCheek/1508/blob/ecb2775f16d239b4d43d7423161d8e7295751a59/initial-setup.md):

    * Set up Atom
    * Set up Seeing Is Believing
    * Github public keys
    * Exercism

    BONUS: Theme your terminal (if we have time)
  - 9:00 (Echo) Superfizz recap

    Meet Josh in the front of Classroom A.

    [https://github.com/turingschool/challenges/blob/master/super_fizz.markdown](https://github.com/turingschool/challenges/blob/master/super_fizz.markdown)
  - 9:30 (Echo) String & Integer riddles

    Continue with Josh in the front of Classroom A.

    NOTE: If you don't know what strings / integers are, let me know.

    Launch pry and see what methods exist on a string:

    (if yours doesn't work: `$ gem install pry` and try again)

    ```ruby
    [1] pry(main)> string = "hello"
    => "hello"

    [2] pry(main)> ls string
    Comparable#methods: <  <=  >  >=  between?
    String#methods:
    %            chr             gsub       rindex       succ!
    *            clear           gsub!      rjust        sum
    # ...
    ```

    As you work your way through this, think about what names you might choose
    to for the methods that do these jobs. Then see if those names are in the list.
    If they are, try them out and see if they give you what you expect.
  * 10:30 Problems, solutions, algorithms
  * 1:00 Scavenger hunt
  * Homework
    * Find a way to improve the environment before you leave today.
      Take a level of ownership as if this was your home, and empower yourself to make something better.
      Maybe you see someone struggling with something and you can offer help (opening a door,
      figuring out a challenge, installing their environment).
      Maybe you see something that is causing an issue for students generally (a full trash can,
      a furniture layout that is causing logistical issues, a cord that people are tripping over,
      an empty pot of coffee, an issue with the scavenger hunt implementation).
      Whatever it is, empower yourself to improve it, and do so.
      Make the environment better for others, and express appreciation as they make it better for you.
      Invest in your community.
    * [Strings and Integers quiz](https://github.com/turingschool/challenges/blob/master/strings_and_integers_quiz.markdown)
    * Headshots tomorrow
* 26 Aug
  *  9:00 Introducing Arrays
  * 10:30 Introducing Hashes
  -  1:00 (Echo) How testing works
  -  2:30 (Echo) Sorting Suite kickoff
  -  3:00 (Echo) Intro to TDD Tutorial
  * (Echo) Homework: Sorting Suite, TERMulator
* 27 Aug
  -  9:00 (Echo) TERMulator recap
  -  9:30 (Echo) Getting started with enumerables
  -  1:00 (Echo) Week 1 diagnostic
  -  2:00 (Echo) Week 1 diagnostic review
  -  2:30 (Echo) Spiral design and test
  * (Echo) Homework: Mythical creatures & enumerable exercises

30 Aug - 5 Sept
---------------

* 31 Aug
  *  9:00 Dynamics
  *  9:30 File I/O
  - 10:30 Object Oriented Programming
  -  1:00 (Echo) Mergesort Demos and Reviews
  -  1:30 (Echo) How Linked Lists work
  *  2:30 (Echo) Robodoku work time
  * (Echo) Homework: Linked lists
* 1 Sept
  *  9:00 How git works
  * 10:30 Using source control
  -  1:00 Pairing without code
  *  2:30 Work time
  * (Echo) Homework: POODR Part 1
* 2 Sept
  -  9:00 Ruby's object model
  *  1:00 Debugging techniques
  *  2:30 Work time
  * (Echo) Homework: Bisecting search
* 3 Sept
  -  9:00 (Echo) Linked list evaluations
  -  1:00 (Echo) How BSTs work
  *  2:30 (Echo) Work time
  * (Echo) Homework: Bisecting search


