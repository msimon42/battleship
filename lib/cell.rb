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

  def fire_upon
    @fired_upon = true
    if self.ship
      @ship.hit
    end
  end

  def render
    if !self.fired_upon
      '.'
    elsif self.fired_upon && self.ship == nil
      'M'
    elsif self.fired_upon && !self.ship.sunk
      'H'
    elsif self.fired_upon && self.ship.sunk
      'X'
    end
  end
end
