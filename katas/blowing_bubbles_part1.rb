# =====  Blowing Bubbles - Part 1 =====
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
    left_index  += 1
    right_index += 1
  end

  times_bubbled += 1
end

array # => ["a", "b", "c", "d", "e"]


# =====  Use `times` instead of `while`  =====
# hints:
#   array.length         # => 5
#   5.pred               # => 4
#   4.times { ... }      # will run the code in the block 4 times
#   4.times { |i| ... }  # the value of `i` will be 0, then 1, then 2, then 3


# =====  Remove the assignment to `left_index`  =====
# hints:
#   i = 0
#   3.times do
#     ...
#     i += 1
#   end
#
#   Is the same thing as:
#   3.times { |i| ... }


# =====  Remove the `right_index` variable  =====
# hints:
#   If you have
#     greet_world = greet("world")
#     greeting    = greet_world + "!"
#
#   Then you can get rid of greet_world by deleting the line that sets it,
#   and replacing any lookup with the calculation that the variable pointed at
#     greeting = greet("world") + "!"


# =====  Join adjacent assignments  =====
# hint:
#   a = 1
#   b = 2
#
#   Can be consolidated with:
#   a, b = 1, 2


# =====  Remove the `left` variable  =====


# =====  Remove the `right` variable  =====


# =====  Inline if statement  =====
# hint:
#   if a
#     b
#   end
#
#   Can be written as
#   b if a


# =====  Inline the blocks!  =====
# Here, we will switch over to the inline version of a block:
#   some_method do
#     some_work
#   end
#
#   Is the same as
#   some_method { some_work }


# =====  Work backwards! =====
# Get back to the beginning:
# 1. Un-inline the blocks
# 2. Un-inline the if statement
# 3. Reintroduce the variables: `left`, and `right`
# 4. Split the assignments
# 5. Add the right_index variable
# 6. Move left_index from the parameter to a local variable
# 7. Use `while` instead of `times`


# =====  Rewrite it without looking  =====
# To complete this challenge, delete the code below and rewrite it from memory,
# without referencing anything.
#
# * If you get stuck, stop and try to remember how it worked.
#   If you can't remember, then look at the implementation, and add it to your solution,
#   then immediately delete it and rewrite it twice.
# * Each time you start, stop and consider the piece that tripped you up the last time,
#   imagine yourself getting to that spot,
#   remembering to stop and draw out the solution you looked up.
# * When you make it all the way through without reference, then you have completed this challenge :D
