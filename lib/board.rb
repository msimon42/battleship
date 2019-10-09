require_relative 'cell'
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

    rows.each do |row|
      row.each_cons(ship.length) do |combo|
        if combo.include?(coordinates)
          true
        end
      end
    end

    columns.each do |column|
      column.each_cons(ship.length) do |combo|
        if combo.include?(coordinates)
          true
        end
      end
    end
    false
  end
end
