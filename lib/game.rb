require_relative 'player'
require_relative 'board'

# Accepts input and plays game
class Game
  include Pieces

  def initialize
    @board = Board.new
    @player1 = Player.new(@name, red_circle)
    @player2 = Player.new(@name, blue_circle)
    @turn = 0
  end

  def play
    introduction
    set_name
    loop do
      current_player = player_turn
      @board.display
      column = player_input(current_player)
      @board.update_board(@board.available_row(column), column, current_player.symbol)
      break if game_over?(current_player) || draw?
    end
    @board.display
  end

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
    @player1.name = ask_name(1)
    @player2.name = ask_name(2)
  end

  def player_input(player)
    loop do
      puts "#{player.symbol} #{player.name}'s turn."
      puts 'Select your column: '
      column = gets.chomp.to_i - 1
      return column if verify_input(column)

      puts 'Invalid input. Try again.'
    end
  end

  def verify_input(input)
    input.between?(0, 6) && !@board.full_column?(input)
  end

  def player_turn
    @turn += 1
    @turn.odd? ? @player1 : @player2
  end

  def game_over?(player)
    6.times do |row|
      7.times do |column|
        if @board.check_four(row, column, player.symbol)
          puts "#{player.name} won! Well done!"
          return true
        end
      end
    end
    false
  end

  def draw?
    if @turn == 42
      puts "It's a Draw!"
      true
    end
  end
end
