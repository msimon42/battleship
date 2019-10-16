require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'

class Ship_test < Minitest::Test
  def setup
    @cruiser = Ship.new('Cruiser', 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_a_name
    assert_equal 'Cruiser', @cruiser.name
  end

  def test_it_has_a_length
    assert_equal 3, @cruiser.length
  end

  def test_it_has_health
    assert_equal 3, @cruiser.health
  end

  def test_hit_decreases_health_correctly
    @cruiser.hit
    assert_equal 2, @cruiser.health
    @cruiser.hit
    assert_equal 1, @cruiser.health
    @cruiser.hit
    assert_equal 0, @cruiser.health
  end

  def test_sunk_after_three_hits
    refute @cruiser.sunk
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit

    assert_equal true, @cruiser.sunk
  end
end
