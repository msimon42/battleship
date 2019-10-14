class Turn
  attr_reader :comp_guess, :human_guess, :comp_player, :human_player

  def initialize(comp_guess, human_guess, comp_player, human_player)
    @comp_guess = comp_guess
    @human_guess = human_guess
    @comp_player = comp_player
    @human_player = human_player
  end

  def computer_fire_shot
     shot = self.human_player.board.fire_upon(@comp_guess)
     if shot == 'Hit'
       puts @comp_player.speak(:computer_hit, @comp_guess)
     elsif shot == 'Miss'
       puts @comp_player.speak(:computer_miss, @comp_guess)
     elsif shot == 'Sunk'
       puts @comp_player.speak(:computer_sunk, @comp_guess, @human_player.board.cells[@comp_guess].ship.name)
     end
  end

  def human_fire_shot
    shot = self.comp_player.board.fire_upon(@human_guess)
    if shot == 'Hit'
      puts @comp_player.speak(:human_hit, @comp_player.board.cells[@human_guess])
    elsif shot == 'Miss'
      puts @comp_player.speak(:human_miss, @comp_player.board.cells[@human_guess])
    elsif shot == 'Sunk'
      puts @comp_player.speak(:human_sunk, @comp_player.board.cells[@human_guess])
    end
  end
end
