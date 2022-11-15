require_relative 'player'
require_relative 'board'

class Game
  include Pieces

  def initialize
    @board = Board.new
    @player1 = Player.new(red_circle)
    @player2 = Player.new(blue_circle)
    @turn = 0
  end

  #play

  def introduction
    puts <<~HEREDOC
      Welcome to Connect Four!

      The aim of the game is to get 4 of your counters in a row.
      One player will be #{red_circle} and one player will be #{blue_circle}.

      Good Luck!
    HEREDOC
  end

  def ask_name(number)
    puts "Enter player#{number} name:"
    gets.chomp
  end

  def set_name
    player1.name = ask_name
    player2.name = ask_name
  end

  def player_input(player)
    loop do
      puts "#{player.symbol} #{player.name}'s turn."
      puts "Select your column: "
      column = gets.chomp.to_i - 1
      return column if verify_input(column)

      puts "Invalid input. Try again."
    end
  end

  def verify_input(input)
    input.between?(0, 6) && !@board.full_column?(input)
  end

  def player_turn
    @turn += 1
    @turn.odd? ? @player1 : @player2
  end


  def game_over?

  #draw?


end