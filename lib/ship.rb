

class Ship
  attr_reader :name, :length, :health, :sunk

  def initialize(name, length)
    @name = name
    @length = length
    @health = self.length #length or @length
    @sunk = false
  end

  def hit
    @health -= 1

    if @health == 0
      @sunk = true
    end
  end
end
