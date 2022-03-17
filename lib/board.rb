
require_relative 'node'
require_relative 'knight'

class Board 

  def initialize
    @board_array = []
    @possible_moves = []
    @player_move = []
    @knight_moves
  end

  def board_array
    (0..7).each do |x|
      temp = []
      (0..7).each do |y| 
        position = Node.new([x,y])
        add_adjacent_squares_knight(position, x, y)
        temp.push(position)
      end
      @board_array.push(temp)
    end
    "RESULT #{@board_array[0]}"
  end
  
 
  def player_move
    puts "Please enter your move:"
    @player_move = gets.chomp.chars
  end

  def validate_player_move; end

  def validate_knight_move; end



  def move_to_coordinates
    move_hash = {a: 0, b: 1, c: 2, d:3, e: 4, f: 5, g:6, h: 7}
    p @move_start = [move_hash[@player_move[0].to_sym], @player_move[1].to_i]
    p @move_end = [[move_hash[@player_move[2].to_sym], @player_move[3].to_i]]

  end

  def coordinates_to_move(coords)
    result_arr = []
    coord_hash = {0 => "a", 1 =>  "b", 2 => "c", 3 => "d", 4 => "e", 5 => "f", 6 => "g", 7 => "h"}
    coords.each do |element|
      result_arr.push([coord_hash[element[0]], element[1]].join(""))
    end
    result_arr.uniq.sort.join(", ")
  end

end

chessboard = Board.new
#chessboard.display_board
p chessboard.board_array
chessboard.player_move
chessboard.move_to_coordinates

#p chessboard.find_node
# p chessboard.knight_moves
# p chessboard.our_moves
# p chessboard.coordinates_to_move(chessboard.our_moves)














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