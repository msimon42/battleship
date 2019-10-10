require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @board = Board.new
    @turn = Turn.new
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_human_player_initial_board_renders_current_cell_statuses_and_ships
    
  end

  def test_comp_player_initial_board_renders_current_cell_statuses_without_ships
  end

  def test_computer_gives_guess
  end

  def test_comp_guess_is_valid
  end

  def test_cell_status_is_shot
  end

  def test_cell_renders_new_shot
  end

  def test_board_renders_new_shot
  end

  def test_prompt_for_user_input
  end

  def test_for_user_input
  end

  def test_user_input_is_valid
    assert_equal true, @turn.valid_guess('A1')
  end
end
