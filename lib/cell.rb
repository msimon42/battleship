require_relative 'ship'
class Cell
  attr_reader :coordinates, :ship, :empty, :adjacent_cells

  def initialize(coordinates)
    @coordinates = coordinates
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @empty = false
    @ship = ship
  end

  def fired_upon?
   @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if self.ship
      @ship.hit
    else
      return 'Miss'
    end

    if self.ship.sunk
      'Sunk'
    else
      'Hit'
    end
  end

  def render(player=false)

    if self.fired_upon? && self.ship == nil
      'M'
    elsif self.fired_upon? && !self.ship.sunk
      'H'
    elsif self.fired_upon? && self.ship.sunk
      'X'
    elsif player && self.ship && !self.fired_upon?
      'S'
    elsif !self.fired_upon?
      '.'
    end
  end
end
