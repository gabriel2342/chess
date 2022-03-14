# Prompt User for a move allowing them to use chess notation
# Check to make sure the move entered is not out of bounds
# Convert user move to an array of two coordinates
# Assgn your first coordinate as the starting node
# Assign you second coordiante as your destination node
# constrcut array of all possible moves from starting node to ending
# Buid a tree/graph from the array

# Objects: 
# 1) Knight
  # 2-65) each square on the 8x8 board???
  # 66) array of possible knight moves
  # 67) our tree/graph 
  # 68) each node on our tree or groah which is posible knight move plus addreses
  


require 'colorize'
require_relative 'node'

chess_unicode = {
  'black_pawn': '\u265F',
  'black_rook': '\u265C',
  'black_knight': '\u265E',
  'black_bishop': '\u265D',
  'black_king': '\u265A',
  'black_queen': '\u265B',
  'white_pawn': '\u2659',
  'white_rook': '\u2656',
  'white_knight': '\u2658',
  'white_bishop': '\u2657',
  'white_king': '\u2654',
  'white_queen': '\u2655'
}


class Board < Node

  def initialize
    @board_array = []
    @possible_moves = []
    @player_move = []
    
  end

  def board_arr
      (0..8).each do |i|
        (0..8).each do |j|
          @board_array.push([i,j])
        end
      end
    p @board_array
  end


  def display_board
      puts " a  b  c  d  e  f  g  h"
      puts (" #{}  ".on_black + " #{}  ".on_light_blue)*4
  end

  def player_move
    puts "Please enter your move:"
    @player_move = gets.chomp.chars
  end

  def validate_player_move; end

  def validate_knight_move; end


  def poss_move_arr(array)

    knight_moves.each do |move|
        array.push([move[0] + @move_start[0], move[1]+ @move_start[1]])
    end
    array.select do |ele|
      ele[0] > 0 && ele[0] < 9 && ele[1] > 0 && ele[1] < 9
    end
  end

  def our_moves
    poss_move_arr(@possible_moves)
  end

  def move_to_coordinates
    move_hash = {a: 1, b: 2, c: 3, d:4, e: 5, f: 6, g:7, h: 8}
    @move_start = [move_hash[@player_move[0].to_sym], @player_move[1].to_i]
    @move_end = [[move_hash[@player_move[2].to_sym], @player_move[3].to_i]]

  end

  def coordinates_to_move(coords)
    result_arr = []
    coord_hash = {1 => "a", 2 =>  "b", 3 => "c", 4 => "d", 5 => "e", 6 => "f", 7 => "g", 8 => "h"}
    coords.each do |element|
      result_arr.push([coord_hash[element[0]], element[1]].join(""))
    end
    result_arr.uniq.sort.join(", ")
  end


  def knight_moves
    [[1,2], [1, -2], [-1, 2], [-1, -2], [2,1], [-2,1], [2, -1], [-2,-1]]
  end

  def initialize_graph
    @root = Node.new(@move_end)
  end

  def build_graph(array)
    return array if array.include?(@move_start)
    initialize_graph
    @root = Node.new(@move_end)
    our_array = poss_move_arr(array)
    build_graph(our_array)
  end

 
end

chessboard = Board.new
chessboard.display_board
#chessboard.board_array
chessboard.player_move
p chessboard.move_to_coordinates
p chessboard.knight_moves
p chessboard.our_moves
p chessboard.coordinates_to_move(chessboard.our_moves)