require_relative 'pieces'

#Creates the board
class Board
  include Pieces

  attr_accessor :grid
  
  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_circle } }
  end

  def display
    puts
    puts ' ' + (1..7).to_a.join('   ')
    @grid.each do |row|
      puts row.join(' | ')
    end
  end

end