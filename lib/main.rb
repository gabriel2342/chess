# frozen_string_literal: true

require_relative 'knight'

class Game
  def player_input
    puts 'Please enter your move:'
    player_move = gets.chomp.chars
    move_to_coordinates(player_move)
  end

  def move_to_coordinates(move)
    move_hash = { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7 }
    @move_start = [move_hash[move[0].to_sym], move[1].to_i - 1]
    @move_end = [move_hash[move[2].to_sym], move[3].to_i - 1]
  end

  def coordinates_to_move(coords)
    result_arr = []
    coord_hash = { 0 => 'a', 1 => 'b', 2 => 'c', 3 => 'd', 4 => 'e', 5 => 'f', 6 => 'g', 7 => 'h' }
    coords.each do |element|
      result_arr.push([coord_hash[element[0]], element[1]].join(''))
    end
    result_arr.uniq.sort.join(', ')
  end

  def player_knight
    our_piece = Knight.new(@move_start, @move_end)
    our_piece.knight_board_array
    our_piece.knight_moves
    our_piece.print_path
  end
end

game = Game.new
game.player_input
game.player_knight
