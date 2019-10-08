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
    rows = [['a1', 'a2', a3, a4], [b1, b2, b3, b4], [c1, c2, c3, c4], [d1, d2, d3, d4]]
    columns = [[a1, b1, c1, d1], [a2, b2, c3, d2], [a3, b3, c3, d3], [a4, b4, c4, d4]]
  end

end