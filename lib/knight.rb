
require_relative 'board'
class Knight < Board
  def knight_moves
    [[1,2], [1, -2], [-1, 2], [-1, -2], [2,1], [-2,1], [2, -1], [-2,-1]]
  end

  def add_adjacent_squares_knight(node, x_axis, y_axis)
    knight_moves.each do |move|
       if (x_axis + move[0]).between?(0,7) && (y_axis + move[1]).between?(0,7)
        node.add_square([x_axis + move[0],y_axis + move[1]])
       end
    end

  end

  def black_knight
    '\u265E'
  end

  def white_knight
    '\u2658'
  end
end