class Ship
  attr_reader :name, :length, :health, :sunk

  def initialize(name, length)
    @name = name
    @length = length
    @health = @length
    @sunk = false
  end

  def hit
    if @health > 0
      @health -= 1
    end
    if @health == 0
      @sunk = true
    end
  end
end
