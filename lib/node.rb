class Square
  attr_accessor :board_position, :adjacent_squares

  def initialize(board_position = nil, adjacent_squares = [])
    @board_position = board_position
    @adjacent_squares = adjacent_squares
  end

  def add_square(adjacent_square)
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
