class Cell
  attr_reader :coordinate, :ship, :empty, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def fire_upon
    
  end
end
