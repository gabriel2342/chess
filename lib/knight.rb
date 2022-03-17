require_relative 'node'

class Knight 

  def initialize(start = nil, finish = nil)
    @start = start
    @end = finish
    @knight_2d_array = []
  end

  def knight_moves
    [[1,2], [1, -2], [-1, 2], [-1, -2], [2,1], [-2,1], [2, -1], [-2,-1]]
  end

  def knight_board_array
    (0..7).each do |x|
      temp = []
      (0..7).each do |y| 
        position = Square.new([x,y])
        add_adjacent_squares_knight(position, x, y)
        temp.push(position)
      end
      @knight_2d_array.push(temp)
    end
    @knight_2d_array
  end

  def move_knight(@start, @end)
    

  end

  def add_adjacent_squares_knight(node, x_axis, y_axis)
    knight_moves.each do |move|
       if (x_axis + move[0]).between?(0,7) && (y_axis + move[1]).between?(0,7)
        node.add_square([x_axis + move[0],y_axis + move[1]])
       end
    end

  end

  def validate_knight_move; end

end