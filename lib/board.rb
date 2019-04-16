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
    puts "#{cell[3]}|#{cell[4]}|#{cell[5]}"
    puts "-----------"
    puts "#{cell[6]}|#{cell[7]}|#{cell[8]}"
  end
end