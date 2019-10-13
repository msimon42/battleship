class Turn
  attr_reader :comp_guess, :human_guess, :board_comp, :board_human

  def initialize(comp_guess, human_guess)
    @comp_guess = comp_guess
    @human_guess = human_guess
    @board_comp = Board.new
    @board_human = Board.new
  end

  def computer_fire_shot
    @board_human.cells[@comp_guess].fire_upon
  end

  def human_fire_shot
    @board_comp.cells[@human_guess].fire_upon
  end
end
