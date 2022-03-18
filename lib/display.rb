# frozen_string_literal: false
require 'colorize'
# Display includes all the strings that will be output in Knights Travails.
module Display
  def display_welcome_banner
    puts "\n\t#{"\u265E" * 113}"
    puts "\t #   #   #    #  #   ####   #    #  #####   ####       #######  #####     ##    #    #    ##    #  #        ####"
    puts "\t #  #    ##   #  #  #    #  #    #    #    #              #     #    #   #  #   #    #   #  #   #  #       #"
    puts "\t ###     # #  #  #  #       ######    #     ####          #     #    #  #    #  #    #  #    #  #  #        ####"
    puts "\t #  #    #  # #  #  #  ###  #    #    #         #         #     #####   ######  #    #  ######  #  #            #"
    puts "\t #   #   #   ##  #  #    #  #    #    #    #    #         #     #   #   #    #   #  #   #    #  #  #       #    #"
    puts "\t #    #  #    #  #   ####   #    #    #     ####          #     #    #  #    #    ##    #    #  #  ######   ####"
    puts "\t#{"\u265E" * 113}"
  end

  def display_try_again
    puts "\n==> Would you like to try another path for your knight?" 
    print "==> Enter 'no' to exit or 'yes' to continue: "
  end

  def display_goodbye
    puts "\n==> Okay, thanks for playing! Goodbye."
  end

  def display_welcome_message
    puts "\n\n==> Welcome to Knights Travails! This program will allow you to calculate the shortest path for a knight from any square on "
    puts '==> chessboard to any square on the chess board. This program works excluaively with algebraic notation. If you are unfamilair'
    puts '==> with algebraic notation in chess please visit https://en.wikipedia.org/wiki/Algebraic_notation_(chess) '
    puts '==> Now lets get started!'
  end

  def display_starting_square_message
    print "\n==> Please enter the starting square for your knight in algebraic notation: "
  end

  def display_desired_ending_message
    print "\n==> Great! Now please enter the desired ending square for your knight in algebraic notation: "
  end

  def display_shorest_path_message(path)
    puts "#{"\n==> The shortest path on the chess board to your desired ending square is ".concat(path.flatten.join(' to '))}.\n"
  end

  def display_calulate_message
    puts "\n==> ".concat("Calculating the shortest path...".light_yellow)
  end

  def display_warning_message
    puts "\n==>".concat(" WARNING: Please enter you desired square in algebraic notation.".red)
  end
end
