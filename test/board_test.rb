require 'minitest'
require 'minitest/autorun'
require_relative '../lib/ship'
require_relative '../lib/board'
require_relative '../lib/cell'

class BoardTest < Minitest::Test
  def setup
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
end