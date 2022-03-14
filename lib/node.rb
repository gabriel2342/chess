class Node
  attr_accessor :value, :neighbors

  def initialize(value = nil, neighbors = [])
    self.value = value
    self.neighbors = neighbors
  end

  def add_edge(neighbor)
    @neighbors << neighbor
  end
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_node(value)
    @nodes << Node.new(value)
  end
end


def level_order
  result = []
  queue = [@root]
  
  until queue.empty?
    node = queue.shift
    queue.push(node.left) unless node.left.nil?
    queue.push(node.right) unless node.right.nil?
    block_given? ? yield(node) : result.push(node.data)
  end
  
  result unless block_given?
end