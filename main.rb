require_relative './lib.game'

def main
  loop do
    connect = Game.new
    connect.play
    break unless play_again?
  end
end

def play_again?
  loop do
    puts 'Do you want to play again?'
    puts 'Enter 1 to play again'
    puts 'Enter 2 to finish'
    input = gets.chomp
    return true if input == '1'
    return false if input == '2'
  end
end

main