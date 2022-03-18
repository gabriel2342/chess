# frozen_string_literal: false

require_relative 'knight'

# Recieves player input and sends messages to our Knight class
class Player
  def initialize
    @move_start = nil
    @move_end = nil
  end

  def validate_input(input)
    input[0].match?(/[A-Za-z]/) && input[1].match?(/\A[-+]?[0-9]+\z/) unless input == ""
  end

  def player_input
    start = ""
    final = ""
    until validate_input(start)
      print "\n==> Please enter the starting square for your knight in algebraic notation: "
      start = gets.chomp.downcase
    end

    until validate_input(final)
      print "\n==> Great! Now please enter the desired ending square for your knight in algebraic notation: "
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
    result_arr.push(coords.join(''))
  end

  def player_knight
    our_piece = Knight.new(@move_start, @move_end)
    our_piece.knight_board_array
    our_piece.knight_moves
    path = our_piece.knight_path
    path = path.map do |coord|
      coordinates_to_move(coord)
    end
    puts "\nCalculating..."
    sleep(2)
    puts "\n==> The shortest path on the chess board to your desired ending square is ".concat(path.flatten.join(' to ')) + "."
  end
end

game = Player.new
game.player_input
game.player_knight
