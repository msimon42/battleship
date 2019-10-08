require 'minitest/autorun'
require 'minitest/pride'
require_relative'../lib/ship'
require_relative '../lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_existence
    assert_instance_of Cell, @cell
  end

  def test_coordinates
    assert_equal "B4", cell.coordinates
  end

  def test_for_ship
    refute @cell.ship
  end

  def test_empty
    assert_equal true, @cell.empty
  end

  def test_fired_upon
    refute @cell.fired_upon
  end
end
