# frozen_string_literal: false

require_relative 'knight'
require_relative 'display'
require 'colorize'

# Recieves player input and sends messages to our Knight class
class Player
  include Display
  attr_reader :move_start, :move_end

  def initialize
    @move_start = nil
    @move_end = nil
    display_welcome_banner
    display_welcome_message
  end

  def validate_input(input)
    input[0].match?(/[A-Za-z]/) && input[1].match?(/\A[-+]?[0-9]+\z/) unless input == ''
  end

  def player_input
    start = ''
    final = ''
    until validate_input(start)
      display_starting_square_message
      start = gets.chomp.downcase
      display_warning_message if validate_input(start) == false
    end

    until validate_input(final)
      display_desired_ending_message
      final = gets.chomp.downcase
    end

    player_move = (start + final).chars
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
    coords[0] = coord_hash[coords[0]]
    coords[1] = (coords[1] + 1).to_s
    result_arr.push(coords.join('').light_green)
  end

  def player_knight
    our_piece = Knight.new(@move_start, @move_end)
    our_piece.knight_board_array
    our_piece.knight_moves
    path = our_piece.knight_path
    path = path.map do |coord|
      coordinates_to_move(coord)
    end
    display_calulate_message
    sleep(2)
    display_shorest_path_message(path)
  end
end

game = Player.new
move_again = ''
until move_again == 'no'
  game.player_input
  game.player_knight
  game.display_try_again
  move_again = gets.chomp.downcase
end

game.display_goodbye
