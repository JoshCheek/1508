# =====  Blowing Bubbles - Part 2 =====
#
# Inspiration:
# [Ana](https://www.youtube.com/watch?v=KMrvR836TFI) and [蘇仲太](https://www.youtube.com/watch?v=QseWXpkaGTY)
#
# In this set of games, we will challenge ourselves to explore and hone a series of skills,
# and insights by repeatedly transforming the representation of a piece of code.
#
# For each challenge:
#   copy the previous solution over to it
#   and edit that solution to meet the new criteria
# You win once you complete the final transformation

# =====  Starting Spot:  =====
a = ["e", "a", "c", "b", "d"]
b = 0

while b < a.length
  c = 0
  d = 1

  while d < a.length
    e = a[c]
    f = a[d]
    if f < e
      a[c]  = f
      a[d] = e
    end
    c += 1
    d += 1
  end

  b += 1
end

a

# =====  Rename the variables  =====
# The variables currently have names which do not allow us to think about what they represent
# Rename them, so that their names describe how to think about them
# Run the code after each renaming to make sure you got it right up to that point.
array = ["e", "a", "c", "b", "d"]
times_bubbled = 0

while times_bubbled < array.length
  left_index  = 0
  right_index = 1

  while right_index < array.length
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
    left_index += 1
    right_index += 1
  end

  times_bubbled += 1
end

array

# =====  Wrap it in a method  =====
# Wrap the body of the sort in a method so that it can be reused against different arrays
# You can tell it works if you can do this:
#   sort(["e", "a", "c", "b", "d"])  # => ["a", "b", "c", "d", "e"]

def sort(array)
  times_bubbled = 0

  while times_bubbled < array.length
    left_index  = 0
    right_index = 1

    while right_index < array.length
      left  = array[left_index]
      right = array[right_index]
      if right < left
        array[left_index]  = right
        array[right_index] = left
      end
      left_index += 1
      right_index += 1
    end

    times_bubbled += 1
  end
  array
end

sort ["e", "a", "c", "b", "d"]


# =====  Wrap the method in a class  =====
# So you can call it like this:
#   BubbleSort.new.sort(["e", "a", "c", "b", "d"])

class BubbleSort
  def sort(array)
    times_bubbled = 0

    while times_bubbled < array.length
      left_index  = 0
      right_index = 1

      while right_index < array.length
        left  = array[left_index]
        right = array[right_index]
        if right < left
          array[left_index]  = right
          array[right_index] = left
        end
        left_index += 1
        right_index += 1
      end

      times_bubbled += 1
    end
    array
  end
end

BubbleSort.new.sort ["e", "a", "c", "b", "d"]


# =====  Wrap the class in a namespace  =====
# So you can call it like this:
#   SortAlgorithms::BubbleSort.new.sort(["e", "a", "c", "b", "d"])

module SortAlgorithms
  class BubbleSort
    def sort(array)
      times_bubbled = 0

      while times_bubbled < array.length
        left_index  = 0
        right_index = 1

        while right_index < array.length
          left  = array[left_index]
          right = array[right_index]
          if right < left
            array[left_index]  = right
            array[right_index] = left
          end
          left_index += 1
          right_index += 1
        end

        times_bubbled += 1
      end
      array
    end
  end
end

SortAlgorithms::BubbleSort.new.sort ["e", "a", "c", "b", "d"]


# =====  Provide the array on initialize, update access to use instance variables  =====
# So you can call it like this:
#
#   BubbleSort.new(["e", "a", "c", "b", "d"]).sort
#
# You'll need to update access to look for `@array` instead of `array`,
# and you'll need to set the instance variable in `initialize`
class BubbleSort
  def initialize(array) 
    @array = array
  end

  def sort
    times_bubbled = 0

    while times_bubbled < @array.length
      left_index  = 0
      right_index = 1

      while right_index < @array.length
        left  = @array[left_index]
        right = @array[right_index]
        if right < left
          @array[left_index]  = right
          @array[right_index] = left
        end
        left_index += 1
        right_index += 1
      end

      times_bubbled += 1
    end
    @array
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort


# =====  Look up @array using a method, `array`, that looks up `@array`, instead  =====
# Switch one call to `@array` back to `array`, and define the `array` method to look up `@array`
#
# Notice:
#   Looking up a local variable named `array` looks like this:
#     array
#
#   Calling a method named `array` can look like any of thesee:
#     self.array()
#     self.array
#     array()
#     array
#
#   Since the last one looks the same as the local variable, you can switch between local variables
#   and instance methods, without changing the code that accesses it!

class BubbleSort
  def initialize(array)
    @array = array
  end
  
  def array
    @array
  end

  def sort
    times_bubbled = 0

    while times_bubbled < array.length
      left_index  = 0
      right_index = 1

      while right_index < @array.length
        left  = @array[left_index]
        right = @array[right_index]
        if right < left
          @array[left_index]  = right
          @array[right_index] = left
        end
        left_index += 1
        right_index += 1
      end

      times_bubbled += 1
    end
    @array
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort



# =====  Switch the remaining `@array` calls to use `array`  =====
# There will be no instance variable access in `sort`

class BubbleSort
  def initialize(array)
    @array = array
  end
  
  def array
    @array
  end

  def sort
    times_bubbled = 0

    while times_bubbled < array.length
      left_index  = 0
      right_index = 1

      while right_index < array.length
        left  = array[left_index]
        right = array[right_index]
        if right < left
          array[left_index]  = right
          array[right_index] = left
        end
        left_index += 1
        right_index += 1
      end

      times_bubbled += 1
    end
    array
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort


# =====  Switch the `array` method to an attr_reader  =====
# Our method looks up an instance variable with the same name.
# This pattern is so common that there is a method you can call,
# that will go create that method.
#
#   class C
#     def a
#       @a
#     end
#   end
#
#   Is the same as
#   class C
#     attr_reader :a
#   end

class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    times_bubbled = 0

    while times_bubbled < array.length
      left_index  = 0
      right_index = 1

      while right_index < array.length
        left  = array[left_index]
        right = array[right_index]
        if right < left
          array[left_index]  = right
          array[right_index] = left
        end
        left_index += 1
        right_index += 1
      end

      times_bubbled += 1
    end
    array
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort


# =====  Extract the swapping code into a method named `bubble_once`  =====
# The most important part of our algorithm is the code that bubbles up the largest value we've seen so far
# Lets extract that into its own method, so that we can call it like this:
#
#   self.bubble_once(left_index, right_index)

class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    times_bubbled = 0

    while times_bubbled < array.length
      left_index  = 0
      right_index = 1

      while right_index < array.length
        self.bubble_once(left_index, right_index)
        left_index += 1
        right_index += 1
      end

      times_bubbled += 1
    end
    array
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort

# =====  Remove unnecessary syntax from `bubble_once`  =====
# These are all the same
#     self.a(b, c)
#     self.a b, c
#     a(b, c)
#     a b, c
#
# Ours invocation looks like the first one, make it look like the last one


class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    times_bubbled = 0

    while times_bubbled < array.length
      left_index  = 0
      right_index = 1

      while right_index < array.length
        self.bubble_once(left_index, right_index)
        left_index += 1
        right_index += 1
      end

      times_bubbled += 1
    end
    array
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort


# =====  Remove `right_index` from `sort` method  =====
# Since we are only using it in one place, we don't really need a whole variable for it

class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    times_bubbled = 0
    while times_bubbled < array.length
      left_index = 0
      while left_index+1 < array.length
        bubble_once left_index, left_index+1
        left_index += 1
      end
      times_bubbled += 1
    end
    array
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort


# ===== Re-add `right_index`, and remove `left_index` instead  =====
# Just to see that there is any number of ways to do a thing
#
# hint:
#   If we have:
#   a = 1
#   b = a + 1
#
#   We can get rid of `b` by replacing it with `a+1`,
#   Or we could get rid of `a` by initializing `b` to `2`,
#   and replacing calls to `a` with `b-1`

class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    times_bubbled = 0
    while times_bubbled < array.length
      right_index = 1
      while right_index < array.length
        bubble_once right_index-1, right_index
        right_index += 1
      end
      times_bubbled += 1
    end
    array
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort


# =====  Replace `while` loops with `times`  =====
# We did this in part 1

class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times do
      right_index = 1
      array.length.pred.times do
        bubble_once right_index-1, right_index
        right_index += 1
      end
    end
    array
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort


# =====  Get rid of the `right_index` variable  =====
# You'll have to move it to a parameter (between the pipes), but pay attention,
# the number that comes out might not match the expected value of `right_index`!
class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times do
      array.length.pred.times do |left_index|
        bubble_once left_index, left_index+1
      end
    end
    array
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort

# =====  Inline the block that calls `bubble_once`  =====
# The 3 lines in the middle of `sort` should get turned into 1 line,
# leaving the `sort` method at only 4 lines (we're not counting the def / end)
class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times do
      array.length.pred.times { |left_index| bubble_once left_index, left_index+1 }
    end
    array
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort



# =====  Extract that long inner loop into a method named `bubble_across`  =====
# The only things it uses that it doesn't have on-hand are `array`, and `bubble_once`,
# both of which are instance methods, so any instance method can call them.
# Thus, that entire line can be replaced with
# 
#   self.bubble_across()

class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times do
      self.bubble_across()
    end
    array
  end
  
  def bubble_across()
    array.length.pred.times { |left_index| bubble_once left_index, left_index+1 }
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort


# =====  Remove unnecessary syntax from `bubble_across`  =====
class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times do
      bubble_across
    end
    array
  end
  
  def bubble_across()
    array.length.pred.times { |left_index| bubble_once left_index, left_index+1 }
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort

# =====  Get `sort` down to 2 lines  =====
# Again, we're not counting the opening def or the closing end
class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times { bubble_across }
    array
  end
  
  def bubble_across()
    array.length.pred.times { |left_index| bubble_once left_index, left_index+1 }
  end
  
  def bubble_once(left_index, right_index)
    left  = array[left_index]
    right = array[right_index]
    if right < left
      array[left_index]  = right
      array[right_index] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort

# =====  Get rid of all references to `right_index`  =====
# Note that we need to update the definition,
# the call site (where we call pass it), and the body of bubble_once
class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times { bubble_across }
    array
  end
  
  def bubble_across
    array.length.pred.times { |left_index| bubble_once left_index }
  end
  
  def bubble_once(left_index)
    left  = array[left_index]
    right = array[left_index+1]
    if right < left
      array[left_index]  = right
      array[left_index+1] = left
    end
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort


# =====  Extract a `swap` method  =====
# In `bubble_once`, we are swapping the left and right elements,
# Pull that code out into a method so you can call it like this:
#
#   self.swap(left_index)
#
# WARNING:
#   Since we aren't passing `left` and `right`, we will have to look them up in the array.
#   If we perform either side of the swapping before the other, then when we look it up, it will be wrong.
#
#   example:
#     left_index          = 0
#     array[left_index]   = array[left_index+1]  
#     array[left_index+1] = array[left_index]    
#           
#     if we start with:                           [2, 1]
#     then copying the right onto the left gives: [1, 1]
#     and copying the left onto the right gives:  [1, 1]
#     but we expected:                            [1, 2]
#
#     So we must use a temporary variable, or multiple assignment: `a, b = b, a`

class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times { bubble_across }
    array
  end
  
  def bubble_across
    array.length.pred.times { |left_index| bubble_once left_index }
  end
  
  def bubble_once(left_index)
    left  = array[left_index]
    right = array[left_index+1]
    if right < left
      self.swap(left_index)
    end
  end
  
  def swap(left_index)
    array[left_index], array[left_index+1] = array[left_index+1], array[left_index]
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort # => ["a", "b", "c", "d", "e"]

# =====  Inline the `if` statement in `bubble_once` =====
class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times { bubble_across }
    array
  end
  
  def bubble_across
    array.length.pred.times { |left_index| bubble_once left_index }
  end
  
  def bubble_once(left_index)
    left  = array[left_index]
    right = array[left_index+1]
    self.swap(left_index) if right < left
  end
  
  def swap(left_index)
    array[left_index], array[left_index+1] = array[left_index+1], array[left_index]
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort # => ["a", "b", "c", "d", "e"]


# =====  Remove unnecessary syntax from the call to `swap`  =====
class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times { bubble_across }
    array
  end
  
  def bubble_across
    array.length.pred.times { |left_index| bubble_once left_index }
  end
  
  def bubble_once(left_index)
    left  = array[left_index]
    right = array[left_index+1]
    swap left_index if right < left
  end
  
  def swap(left_index)
    array[left_index], array[left_index+1] = array[left_index+1], array[left_index]
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort # => ["a", "b", "c", "d", "e"]


# =====  Get rid of the variables `left` and `right` in `bubble_once`  =====
class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times { bubble_across }
    array
  end
  
  def bubble_across
    array.length.pred.times { |left_index| bubble_once left_index }
  end
  
  def bubble_once(left_index)
    swap left_index if array[left_index+1] < array[left_index]
  end
  
  def swap(left_index)
    array[left_index], array[left_index+1] = array[left_index+1], array[left_index]
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort # => ["a", "b", "c", "d", "e"]

# =====  Extract the logic for deciding whether to swap into `swap?`  =====
# This method is not special, it just ends with a question mark.
# Rubyists often use this to let the caller know it returns true or false
#
# hint:
#   Pay attention to what that code uses.
#   If it uses an instance variable or an instance method,
#   Then it is fine, because it can still look them up.
#   If it uses a local variable, then it won't have access, we will need to pass it.

class BubbleSort
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sort
    array.length.times { bubble_across }
    array
  end
  
  def bubble_across
    array.length.pred.times { |left_index| bubble_once left_index }
  end
  
  def bubble_once(left_index)
    swap left_index if self.swap?(left_index)
  end
  
  def swap(left_index)
    array[left_index], array[left_index+1] = array[left_index+1], array[left_index]
  end
  
  def swap?(left_index)
    array[left_index+1] < array[left_index]
  end
end

BubbleSort.new(["e", "a", "c", "b", "d"]).sort # => ["a", "b", "c", "d", "e"]

# =====  Reverse each thing you did until you are all the way back to the beginning  =====
# This doesn't need to be exact, but it should be pretty close
# (note: the pointless names were assigned alphabetically in order of appearance)
a = ["e", "a", "c", "b", "d"]

b = 0
while b < a.length
  c  = 0
  d = 1
  while d < a.length
    if a[d] < a[c]
      e  = a[c]
      f = a[d]
      a[c]  = f
      a[d] = e
    end
    c  += 1
    d += 1
  end
  b += 1
end

a # => ["a", "b", "c", "d", "e"]

# swap order
# spaceship operator
# blocks

#
# Game 2: [I'm Forever Blowing Bubbles](https://www.youtube.com/watch?v=yvuOtlpSAeY)
#
#   * Round 1: Complete "The art of Ana and 蘇仲太 part 1"
#   * Round 2: Complete "The art of Ana and 蘇仲太 part 2"
#   * Round 3: Time yourself on "The art of Ana and 蘇仲太 part 1",
#     then practice until you can complete it in half that time
#     (hint: if you have one that was particularly slow,
#     it is more effective to do this one several times in a row
#     than to only practice it in the midst of the others which are easier for you)
#   * Round 4: Time yourself on "The art of Ana and 蘇仲太 part 2",
#     then practice until you can complete it in half that time.
#   * Round 5: Complete "The art of Ana and 蘇仲太 part 1" with no mistakes
#     (each one runs successfully the first time you run it).
#     You may use 2 "save spots".
#     Example: if you complete the first 4 challenges without a mistake,
#     but feel uncomfortable with the 5th,
#     then you can use one of your save spots before beginning the 5th.
#     This means that if you make any mistakes as you do the rest of them,
#     that you have to start over at challenge 5 rather than challenge 1.
#   * Round 6: Complete "The art of Ana and 蘇仲太 part 1" in ? minutes.
#     Pay attention to what is costing the most time.
#     * Is it your typing speed?
#       Then practice typing between each one (I use Type Fu, you can buy it in the App store).
#     * Is it some particular type of editing? Then analyze that editing skill, come up with a
#       series of keystrokes that addresses it well, and practice them until that part of the
#       problem isn't holding you back. Eg if you need to indent 3 lines, and it's expensive to
#       go to the front of the line, indent, go to the next line, indent, etc, then analyze/google,
#       and create a plan like "hold shift, press C-n/down twice",
#       and then indent the whole block at once with `Command+]`
#     * Is it how some particular piece of refactoring works?
#       Then practice that one refactoring 5 times (do/undo/do/undo/do/undo/do/undo/do/undo)
#   * Round 7: Complete "The art of Ana and 蘇仲太 part 2" in ? minutes.

