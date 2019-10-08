class Cell
  attr_reader :coordinates, :ship, :empty, :fired_upon

  def initialize(coordinates)
    @coordinates = coordinates
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def fire_upon
    true
  end

  def render
    if self.fired_upon == false
      '.'
    elsif self.fired_upon == true && self.ship == nil
      'M'
    elsif self.fired_upon == true && self.ship == true
      'H'
    elsif self.fired_upon == true && self.ship.sunk == true
      'X'
    end
  end
end
