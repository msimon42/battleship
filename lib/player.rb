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

  def take_turn(guess)

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
    end
  end

  def place_ship(ship, coordinates=Array.new)
    if self.is_computer
      @board.place_ship(ship, self.generate_placement(ship))
    else
      @board.place_ship(ship, coordinates)
    end
  end
end

matt = Player.new

p matt.generate_placement(matt.ships[:Cruiser])