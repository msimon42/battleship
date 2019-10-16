require 'minitest/autorun'
require_relative '../lib/game'

class MyTest < MiniTest::Test
  def setup
    @game = Game.new
  end

  def test_guess_rows
    skip
    @game.computer_player.record_hit('B2')
    @game.computer_player.record_hit('B3')
    assert true, @game.human_player.board.cells.keys.include?(@game.guess(@game.computer_player))
  end

  def test_guess_cols
    @game.computer_player.record_hit('B2')
    @game.computer_player.record_hit('C2')
    assert true, @game.human_player.board.cells.keys.include?(@game.guess(@game.computer_player))
  end
end
