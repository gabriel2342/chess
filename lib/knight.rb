require_relative 'node'

class Knight 

  def initialize(start = nil, finish = nil)
    @start = start
    @finish = finish
    @knight_2d_array = []
    @path_followed = Hash.new
  end

  def potential_knight_moves
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

  # def reconstruct_path(parent, child)
  #   @path = []
  #   until child.nil?
  # end


  def knight_moves(root = @knight_2d_array[@start[0]][@start[1]])
    queue = [root]
    past_moves = []  # def reconstruct_path(parent, child)
    #   @pa]
    #   until child.nil?
    # end
    @path_followed[root.board_position] = nil
    until queue.empty?
      move = queue.shift
      past_moves.push(move.board_position)

      move.adjacent_squares.each do |mov| 
        queue.push(@knight_2d_array[mov[0]][mov[1]]) unless past_moves.include?(mov)
        @path_followed[mov] = move.board_position unless past_moves.include?(mov)
      end

      return @path_followed if move.board_position == @finish

    end
  end

  def add_adjacent_squares_knight(node, x_axis, y_axis)
    potential_knight_moves.each do |move|
       if (x_axis + move[0]).between?(0,7) && (y_axis + move[1]).between?(0,7)
        node.add_square([x_axis + move[0],y_axis + move[1]])
       end
    end

  end

  def validate_knight_move; end

end