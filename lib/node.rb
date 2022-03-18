# frozen_string_literal: true

# Builds node containing position and pointing to array of possible legal moves
class Square
  attr_reader :board_position, :adjacent_squares

  def initialize(board_position = nil, adjacent_squares = [])
    @board_position = board_position
    @adjacent_squares = adjacent_squares
  end

  def add_square(adjacent_square)
    @adjacent_squares << adjacent_square
  end
end
