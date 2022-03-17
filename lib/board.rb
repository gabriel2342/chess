
require_relative 'node'
require_relative 'knight'

class Board 

  def initialize
    @player_move = []
  end

  


end
















  # def poss_move_arr(array)

  #   knight_moves.each do |move|
  #       array.push([move[0] + @move_start[0], move[1]+ @move_start[1]])
  #   end
  #   array.select do |ele|
  #     ele[0] > 0 && ele[0] < 9 && ele[1] > 0 && ele[1] < 9
  #   end
  # end

  # def our_moves
  #   poss_move_arr(@possible_moves)
  # end