require 'minitest/autorun'
require 'minitest/pride'
require_relative'../lib/ship'
require_relative '../lib/cell'

class CellTest < Minitest::Test

  def setup
    @ship_1 = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_coordinates
    assert_equal "B4", @cell.coordinates
  end

  def test_cell_originally_without_ship
    refute @cell.ship
  end

  def test_if_empty_to_start
    assert_equal true, @cell.empty?
  end

  def test_fire_upon_functions
    @cell.place_ship(@ship_1)
    @cell.fire_upon

    assert @cell.fired_upon?
    assert_equal 2, @ship_1.health
  end

  def test_fired_upon
    refute @cell.fired_upon?
    @cell.fire_upon

    assert_equal true, @cell.fired_upon?
    end

  def test_place_ship
    refute @cell.ship
    @cell.place_ship(@ship_1)

    assert_equal @ship_1, @cell.ship
    refute @cell.empty
  end

  def test_returns_correct_string_for_miss
    @cell.fire_upon
    assert_equal 'Miss', @cell.fire_upon
  end

  def test_returns_correct_string_for_hit
    @cell.place_ship(@ship_1)
    @cell.fire_upon

    assert_equal 'Hit', @cell.fire_upon
  end

  def test_returns_correct_string_for_sunk
    @cell.place_ship(@ship_1)
    @cell.fire_upon
    @cell.fire_upon
    @cell.fire_upon

    assert_equal 'Sunk', @cell.fire_upon
  end

  def test_ship_health_changes_when_cell_hit
    @cell.place_ship(@ship_1)
    assert_equal 3, @ship_1.health
    @cell.fire_upon

    assert_equal 2, @ship_1.health
  end

  def test_render_empty_cell
    assert_equal '.', @cell.render
  end

  def test_render_miss
    @cell.fire_upon
    assert_equal 'M', @cell.render
  end

  def test_render_hit
    @cell.place_ship(@ship_1)
    @cell.fire_upon

    assert_equal 'H', @cell.render
  end

  def test_render_ship
    @cell.place_ship(@ship_1)
    assert_equal 'S', @cell.render(true)
  end

  def test_render_sunk
    @cell.place_ship(@ship_1)
    @cell.fire_upon
    @cell.fire_upon
    @cell.fire_upon
    
    assert_equal 'X', @cell.render
  end
end
