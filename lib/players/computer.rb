module Players
  class Class < Player
    
    def move(board)
      puts "Please enter 1-9:"
      input = gets.strip
    end
  end
end