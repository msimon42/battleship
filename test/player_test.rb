require 'minitest/autorun'
require_relative '../lib/player'

class PlayerTest < MiniTest::Test
  def setup
    @player1 = Player.new
    @player2 = Player.new(true)
  end

  def test_exist
    assert_instance_of Player, @player1
  end

  def test_generate_placement
    assert @player2.board.valid_placement?(@player2.ships[:Cruiser],@player2.generate_placement(@player2.ships[:Cruiser]))
  end


end