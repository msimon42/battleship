require_relative 'ship'
class Cell
  attr_reader :coordinates, :ship, :empty, :fired_upon

  def initialize(coordinates)
    @coordinates = coordinates
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def place_ship(ship)
    @empty = false
    @ship = ship
  end
  #board_array.select(random number, random + 1, random + 2)
  #board_array.select(random number[1-8], random + 4, random + 8)
  
  # def fired_upon?
  #  @fired_upon
  # end

  def fire_upon
    @fired_upon = true
    if self.ship
      @ship.hit
    end
  end

  def render(player=false)

    if self.fired_upon && self.ship == nil
      'M'
    elsif self.fired_upon && !self.ship.sunk
      'H'
    elsif self.fired_upon && self.ship.sunk
      'X'
    elsif player && self.ship && !self.fired_upon
      'S'
    elsif !self.fired_upon
      '.'
    end
  end
end


# cell_1 = Cell.new('A1')
# cell_2 = Cell.new('A2')
# ship = Ship.new('Cruiser', 3)
#
# cell_1.place_ship(ship)
# p cell_1.render
# p cell_1.render(true)