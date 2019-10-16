require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'
require_relative '../lib/board'
require_relative '../lib/cell'

class BoardTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
  end

  def test_existence
    assert_instance_of Board, @board
  end

  def test_hash
    assert_instance_of Hash, @board.cells
  end

  def test_board_size
    assert_equal 16, @board.cells.length
  end

  def test_cells_are_cells
    assert_instance_of Cell, @board.cells['C2']
  end

  def test_valid_coordinate?
    assert @board.valid_coordinate?('A2')
    refute @board.valid_coordinate?('F5')
  end

  def test_valid_placement
    assert_equal true, @board.valid_placement?(@cruiser, ['A1', 'A2', 'A3'])
    assert_equal true, @board.valid_placement?(@submarine, ['D2', 'D1'])
    assert_equal true, @board.valid_placement?(@cruiser, ['A1', 'B1', 'C1'])
    assert_equal true, @board.valid_placement?(@submarine, ['B3', 'B4'])
    assert_equal true, @board.valid_placement?(@submarine, ['A3', 'B3'])
    assert_equal false, @board.valid_placement?(@cruiser, ['A1', 'B2', 'C3'])
    assert_equal false, @board.valid_placement?(@submarine, ['A1', 'A2', 'A3'])
    assert_equal false, @board.valid_placement?(@cruiser, ['A1', 'A2'])
    assert_equal false, @board.valid_placement?(@cruiser, ['C5', 'F7', 'W3'])
  end

  def test_place_ship
    @board.place_ship(@cruiser, ['A1', 'A2', 'A3'])

    refute @board.cells['A1'].empty
    assert_equal @board.cells['A2'].ship, @cruiser
  end

  def test_invalid_placement
    assert_equal 'Invalid Input',  @board.place_ship(@cruiser, ['F3', 'C2', 'D4'])
  end

  def test_adjacent_cells
    assert_equal ['B1', 'B3'], @board.find_adjacent_cells('B2', @board.rows)
    assert_equal ['A2', 'C2'], @board.find_adjacent_cells('B2', @board.columns)
  end

  def test_all_adjacent_cells
    assert_equal ['B1', 'B3', 'A2', 'C2'], @board.find_all_adjacent_cells('B2')
  end

  def test_generate_possible_placements
    eachcons = Array.new
    @board.rows.each {|row| row.each_cons(3) {|coordinates| eachcons << coordinates}}
    @board.columns.each {|col| col.each_cons(3) {|coordinates| eachcons << coordinates}}
    assert_equal eachcons, @board.generate_possible_placements(@cruiser)
  end

  def test_render
    assert_equal "1 2 3 4 \n" +
                    "A #{@board.cells['A1'].render} #{@board.cells['A2'].render} #{@board.cells['A3'].render} #{@board.cells['A4'].render}\n" +
                     "B #{@board.cells['B1'].render} #{@board.cells['B2'].render} #{@board.cells['B3'].render} #{@board.cells['B4'].render}\n" +
                     "C #{@board.cells['C1'].render} #{@board.cells['C2'].render} #{@board.cells['C3'].render} #{@board.cells['C4'].render}\n" +
                     "D #{@board.cells['D1'].render} #{@board.cells['D2'].render} #{@board.cells['D3'].render} #{@board.cells['D4'].render}", @board.render


    assert_equal "1 2 3 4 \n" + "A #{@board.cells['A1'].render(true)} #{@board.cells['A2'].render(true)} #{@board.cells['A3'].render(true)} #{@board.cells['A4'].render(true)}\n" +
                      "B #{@board.cells['B1'].render(true)} #{@board.cells['B2'].render(true)} #{@board.cells['B3'].render(true)} #{@board.cells['B4'].render(true)}\n" +
                      "C #{@board.cells['C1'].render(true)} #{@board.cells['C2'].render(true)} #{@board.cells['C3'].render(true)} #{@board.cells['C4'].render(true)}\n" +
                      "D #{@board.cells['D1'].render(true)} #{@board.cells['D2'].render(true)} #{@board.cells['D3'].render(true)} #{@board.cells['D4'].render(true)}", @board.render(true)
  end
end
