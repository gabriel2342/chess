class Node
  attr_accessor :value, :neighbors

  def initialize(position = nil, adjacent_squares = [])
    @position = position
    @adjacent_squares = adjacent_squares
  end

  def add_edge(adjacent_square)
    @adjacent_squares << adjacent_square
  end
end

# class Graph
#   attr_accessor :nodes

#   def initialize
#     @nodes = []
#   end

#   def add_node(value)
#     @nodes << Node.new(value)
#   end
# end


