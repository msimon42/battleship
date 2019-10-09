require_relative 'cell'
require_relative 'ship'
class Board
  attr_reader :cells

  def initialize
    @cells = {
        'A1' => Cell.new('A1'),
        'A2' => Cell.new('A2'),
        'A3' => Cell.new('A3'),
        'A4' => Cell.new('A4'),
        'B1' => Cell.new('B1'),
        'B2' => Cell.new('B2'),
        'B3' => Cell.new('B3'),
        'B4' => Cell.new('B4'),
        'C1' => Cell.new('C1'),
        'C2' => Cell.new('C2'),
        'C3' => Cell.new('C3'),
        'C4' => Cell.new('C4'),
        'D1' => Cell.new('D1'),
        'D2' => Cell.new('D2'),
        'D3' => Cell.new('D3'),
        'D4' => Cell.new('D4')
    }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    rows = [['A1', 'A2', 'A3', 'A4'], ['B1', 'B2', 'B3', 'B4'], ['C1', 'C2', 'C3','C4'], ['D1', 'D2', 'D3', 'D4']]
    columns = [['A1', 'B1', 'C1', 'D1'], ['A2', 'B2', 'C2', 'D2'], ['A3', 'B3', 'C3', 'D3'], ['A4', 'B4', 'C4', 'D4']]

    coordinates.each do |coordinate|
      if self.cells[coordinate] == nil || self.cells[coordinate].ship
        return false
      end
    end

    rows.each do |row|
      row.each_cons(ship.length) do |combo|
        if combo == coordinates
          return true
        end
      end
    end

    columns.each do |column|
      column.each_cons(ship.length) do |combo|
        if combo == coordinates
           return true
        end
      end
    end
    false
  end

  def place_ship(ship, coordinates)
    if !self.valid_placement?(ship, coordinates)
      "Invalid Input"
    else
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(player=false)
     if player
       "1 2 3 4 \n" + "A #{self.cells['A1'].render(true)} #{self.cells['A2'].render(true)} #{self.cells['A3'].render(true)} #{self.cells['A4'].render(true)}
       \n" + "B #{self.cells['B1'].render(true)} #{self.cells['B2'].render(true)} #{self.cells['B3'].render(true)} #{self.cells['B4'].render(true)}
       \n" + "C #{self.cells['C1'].render(true)} #{self.cells['C2'].render(true)} #{self.cells['C3'].render(true)} #{self.cells['C4'].render(true)}
       \n" + "D #{self.cells['D1'].render(true)} #{self.cells['D2'].render(true)} #{self.cells['D3'].render(true)} #{self.cells['D4'].render(true)} "
     end


    "1 2 3 4 \n" + "A #{self.cells['A1'].render} #{self.cells['A2'].render} #{self.cells['A3'].render} #{self.cells['A4'].render}\n" +
            "B #{self.cells['B1'].render} #{self.cells['B2'].render} #{self.cells['B3'].render} #{self.cells['B4'].render}\n" +
            "C #{self.cells['C1'].render} #{self.cells['C2'].render} #{self.cells['C3'].render} #{self.cells['C4'].render}\n" +
            "D #{self.cells['D1'].render} #{self.cells['D2'].render} #{self.cells['D3'].render} #{self.cells['D4'].render} "
  end
end


board = Board.new
cruiser = Ship.new('cruiser', 3)

puts board.render
board.place_ship(cruiser, ['A1', 'A2', 'A3'])
puts board.render(true)
puts board.cells['A1'].ship


