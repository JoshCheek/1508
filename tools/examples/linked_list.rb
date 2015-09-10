class List
  def unshift(joke)
    @head = {data: joke, next_node: @head}
  end

  def count
    count   = 0
    current = @head
    while current
      count += 1
      current = current[:next_node]
    end
    count
  end
end

def fill_er_up(collection)
  collection.unshift(1)
  collection.unshift(4)
  collection.unshift(23)
  collection.unshift(83)
  "I put #{collection.count} things into there for ya!"
end

fill_er_up []
fill_er_up List.new
