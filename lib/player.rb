require_relative 'board'
require_relative 'ship'
require_relative 'cell'

class Player
  attr_reader :is_computer, :board, :ships

  def initialize(is_computer=false)
    @is_computer = is_computer
    @board = Board.new
    @ships = {:Cruiser=>Ship.new('Cruiser', 3), :Submarine=>Ship.new('Submarine', 2)}
  end

  def guess
    if self.is_computer
      loop do
        guess = @board.cells.keys.sample
        return guess if @board.valid_coordinate?(guess)
      end
    else
      loop do
        puts "Enter your guess: "
        guess = gets.chomp
        return guess if @board.valid_coordinate?(guess)
        puts "Coordinate not found or has already been fired upon."
      end
    end
  end

  def ships_sunk?
    @ships.all? {|ship| ship[1].sunk}
  end

  def generate_placement(ship)
    possible_placements = @board.generate_possible_placements(ship)

    loop do
       placement = possible_placements.sample
       return placement if @board.valid_placement?(ship, placement)
       "Cell not found."
    end
  end

  def place_ship(ship, coordinates='')
    if self.is_computer
      @board.place_ship(ship, self.generate_placement(ship))
    else
      loop do
        placement = @board.place_ship(ship, coordinates)
        next if placement == "Invalid Input"
        placement
        break
      end
    end
  end

  def speak(situation, cell='', ship='')
    situations = {
        :beginning => "I have laid out my ships on the grid. It is now your turn to lay out your ships. The Cruiser is 3 units long, and the Submarine is 2 units long.",
        :human_hit => "No!! Your shot on #{cell} was a hit!",
        :human_miss => "Your shot on #{cell} was a miss! Better luck next time!",
        :human_sunk => "I hope you're happy. You sunk my #{ship}",
        :computer_hit => "Ha! My shot on #{cell} was a hit",
        :computer_miss => "Dammit! My shot on #{cell} was a miss",
        :computer_sunk => "Yes!!!!! Your #{ship} has been sunk!!",
        :computer_won => "I have won! Better luck next time I guess.",
        :computer_lost => "I have been defeated! You are the superior being."
    }
    situations[situation]
  end
end


