require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new('A1', 'B1')
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_comp_shot_affects_human_board
    refute @turn.board_human.cells['A1'].fired_upon
    @turn.computer_fire_shot
    assert_equal true, @turn.board_human.cells['A1'].fired_upon
  end

  def test_human_shot_affects_comp_board
    refute @turn.board_comp.cells['B1'].fired_upon
    @turn.human_fire_shot
    assert_equal true, @turn.board_comp.cells['B1'].fired_upon
  end

  def test_ship_health_decreases_with_shot
    skip
  end

  def test_cell_status_is_shot
    skip
  end

  def test_cell_renders_new_shot
    skip
  end

  def test_board_renders_new_shot
    skip
  end
end

# turn makes sure cells and board rendering correctly
# ends with feedback: "speak" is method in player
