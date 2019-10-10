require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @board = Board.new
    @turn = Turn.new('A1')
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end



  def test_guess_valid
    assert_equal true, @turn.valid_guess('A1')
  end
end
