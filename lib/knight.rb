# frozen_string_literal: true

require_relative 'node'

FINAL = 0
# Our knight class representing the black and white knights on the board
class Knight
  def initialize(start = nil, finish = nil)
    @start = start
    @finish = finish
    @knight_2d_array = []
    @past_moves = []
    @path_followed = {}
  end

  def potential_knight_moves
    [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]]
  end

  def build_knight_board(x_coord, y_coord, temp)
    position = Square.new([x_coord, y_coord])
    add_adjacent_squares_knight(position, x_coord, y_coord)
    temp.push(position)
  end

  def knight_board_array
    (0..7).each do |x_coord|
      temp = []
      (0..7).each do |y_coord|
        build_knight_board(x_coord, y_coord, temp)
      end
      @knight_2d_array.push(temp)
    end
  end

  def build_adjacent_list(moves, queue)
    moves.adjacent_squares.each do |mov|
      unless @past_moves.include?(mov)
        queue.push(@knight_2d_array[mov[0]][mov[1]]) 
        @path_followed[mov] = moves.board_position 
      end
    end
  end

  def knight_search(queue)
    move = queue.shift
    knight_position = move.board_position
    @past_moves.push(knight_position)
    build_adjacent_list(move, queue)
    knight_position
  end

  def knight_moves
    root = @knight_2d_array[@start[0]][@start[1]]
    queue = [root]
    @path_followed[root.board_position] = FINAL
    until queue.empty?
      knight_position = knight_search(queue)
      return @path_followed if knight_position == @finish
    end
  end

  def print_path
    p backtrace_path(@finish)
  end

  def backtrace_path(tail)
    moves = []
    until tail ==  FINAL
      moves.push(tail)
      tail = @path_followed[tail]
    end
    moves.reverse
  end

  def add_adjacent_squares_knight(node, x_coord, y_coord)
    potential_knight_moves.each do |move|
      x_axis, y_axis = x_coord + move[0], y_coord + move[1]
        node.add_square([x_axis, y_axis]) if x_axis.between?(0, 7) && y_axis.between?(0, 7)
    end
  end

  def validate_knight_move; end
end
