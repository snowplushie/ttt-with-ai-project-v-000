class Board
  attr_accessor :cells
  
  def initialize()
    reset!
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts "#{cell[0]}|#{cell[1]}|#{cell[2]}"
    puts "-----------"
    puts "   |   |   "
    puts "-----------"
    puts "   |   |   "
  end
end