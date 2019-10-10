class Turn
  attr_reader :guess

  def initialize
    @guess = guess #gets.chomp?
    @board_human = Board.new
    @board_comp = Board.new
  end

  def valid_guess(guess)
     @board_human.valid_coordinate?('A1')
     @board_comp.valid_coordinate?('A1')
  end
end
