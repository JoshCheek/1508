class Node
  attr_accessor :data, :left, :right
  def initialize(data, left=nil, right=nil)
    @data, @left, @right = data, left, right
  end
end

def sort(node)
  unless node.left.nil?
    sort(node.left)
  end

  p node.data

  if node.right
    sort node.right
  end
end

tree = Node.new('d',
  Node.new('b',
    Node.new('a'),
    Node.new('c')),
  Node.new('f',
    Node.new('e'),
    Node.new('g'))
)

sort tree
