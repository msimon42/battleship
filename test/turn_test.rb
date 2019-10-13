require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new('A1', 'D1')
    @cruiser = Ship.new("Cruiser", 3)
    @sub = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_comp_shot_affects_human_board
    refute @turn.board_human.cells['A1'].fired_upon
    @turn.computer_fire_shot
    assert_equal true, @turn.board_human.cells['A1'].fired_upon
    assert_equal 'M', @turn.board_human.cells['A1'].render
  end

  def test_human_shot_affects_comp_board
    refute @turn.board_comp.cells['D1'].fired_upon
    @turn.human_fire_shot
    assert_equal true, @turn.board_comp.cells['D1'].fired_upon
    assert_equal 'M', @turn.board_comp.cells['D1'].render
  end

  def test_human_ship_health_decreases_with_shot
    @turn.board_human.place_ship(@cruiser, ['A1', 'B1', 'C1'])
    assert_equal "Cruiser", @turn.board_human.cells['A1'].ship.name
    assert_equal 3, @turn.board_human.cells['A1'].ship.health
    @turn.computer_fire_shot
    assert_equal 2, @turn.board_human.cells['A1'].ship.health
  end

  def test_comp_ship_health_decreases_with_shot
    @turn.board_comp.place_ship(@sub, ['D1', 'D2'])
    assert_equal "Submarine", @turn.board_comp.cells['D1'].ship.name
    assert_equal 2, @turn.board_comp.cells['D1'].ship.health
    @turn.human_fire_shot
    assert_equal 1, @turn.board_comp.cells['D1'].ship.health
  end

  # def test_cell_status_is_shot
  #   skip
  # end
  #
  # def test_cell_renders_new_shot
  #   skip
  # end
  #
  # def test_board_renders_new_shot
  #   skip
  # end
end
