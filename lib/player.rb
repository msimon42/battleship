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
      guess = @board.cells.keys.sample
    else
      loop do
        puts "Enter your guess: "
        guess = gets.chomp
        return guess if @board.valid_coordinate?(guess)
      end
    end
    guess #fix this if there is time
  end

  def generate_placement(ship)
    possible_placements = Array.new
    @board.rows.each do |row|
      row.each_cons(ship.length) {|coordinates| possible_placements << coordinates}
    end
    @board.columns.each do |column|
      column.each_cons(ship.length) {|coordinates| possible_placements << coordinates}
    end

    loop do
       placement = possible_placements.sample
       return placement if @board.valid_placement?(ship, placement)
       "Cell not found."
    end
  end

  def place_ship(ship)
    if self.is_computer
      @board.place_ship(ship, self.generate_placement(ship))
    else
      loop do
        puts "Enter the coordinates for your #{ship.name}"
        coordinates = gets.chomp
        placement = @board.place_ship(ship, coordinates.tr(",", "").split(" "))
        next if placement == "Invalid Input"
        placement
        break
      end
    end
  end

  def speak(situation, cell = '')
    situations = {
        :beginning => "I have laid out my ships on the grid. It is now your turn to lay out your ships.",
        :after_turn_hit => "No!! Your shot on #{cell} was a hit!",
        :after_turn_miss => "Your shot on #{cell} was a miss! Better luck next time!"


    }

    situations[situation]
  end


end

matt = Player.new(true)
other_matt = Player.new
p matt.is_computer
p matt.generate_placement(matt.ships[:Cruiser])
p matt.place_ship(matt.ships[:Cruiser])
#p matt.fire
puts matt.board.render(true)
puts other_matt.place_ship(other_matt.ships[:Cruiser])
puts other_matt.board.render(true)