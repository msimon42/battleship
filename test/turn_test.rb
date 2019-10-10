require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @board_human = Board.new
    @board_comp = Board.new
    @turn = Turn.new
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_human_player_board_renders_current_cell_statuses_and_ships
    @board_human.render(true)
    assert_equal ("1 2 3 4 \n" + "A #{@board_human.cells['A1'].render(true)} #{@board_human.cells['A2'].render(true)} #{@board_human.cells['A3'].render(true)} #{@board_human.cells['A4'].render(true)}\n" +
    "B #{@board_human.cells['B1'].render(true)} #{@board_human.cells['B2'].render(true)} #{@board_human.cells['B3'].render(true)} #{@board_human.cells['B4'].render(true)}\n" +
    "C #{@board_human.cells['C1'].render(true)} #{@board_human.cells['C2'].render(true)} #{@board_human.cells['C3'].render(true)} #{@board_human.cells['C4'].render(true)}\n" +
    "D #{@board_human.cells['D1'].render(true)} #{@board_human.cells['D2'].render(true)} #{@board_human.cells['D3'].render(true)} #{@board_human.cells['D4'].render(true)}"), @turn.display_human_board
  end

  def test_comp_player_board_renders_current_cell_statuses_without_ships
    @board_comp.render
    assert_equal @board_comp.render, @turn.display_computer_board
  end

  def test_computer_gives_guess
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

  def test_prompt_for_user_input
    skip
  end

  def test_for_user_input
    skip
  end
end

# turn makes sure cells and board rendering correctly
# ends with feedback: "speak" is method in player
