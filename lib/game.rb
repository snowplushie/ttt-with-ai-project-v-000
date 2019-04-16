class Game
  attr_accessor :board, :player_1, :player_2
  
   WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
 ]
 
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[1]] == @board.cells[combination[2]] &&
      @board.taken?(combination[0]+1)
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    @board.full? || won?
  end
  
  def winner
    if won?
      winning_combination = won?
      @board.cells[winning_combination[0]]
    else
      nil
    end
  end
  
  def turn
    move = current_player.move(@board)
    if !@board.valid_move?(move)
      move
    else
     self.turn
    end
    @board.update(move, current_player) && @board.display
  end
  
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end