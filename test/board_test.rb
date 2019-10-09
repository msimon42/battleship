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
    require "pry"; binding.pry
    assert @board.valid_placement?(@cruiser, ['A1', 'A2', 'A3'])
    assert @board.valid_placement?(@cruiser, ['A1', 'B1', 'C1'])
    assert @board.valid_placement?(@submarine, ['B3', 'B4'])
    assert @board.valid_placement?(@submarine, ['A3', 'B3'])
    refute @board.valid_placement?(@cruiser, ['A1', 'B2', 'C3'])
  end
end
