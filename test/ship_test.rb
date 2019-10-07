require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'

class Ship_test < Minitest::Test
  def setup
    @cruiser = Ship.new('Cruiser', 3)
  end

  def test_existence
    assert_instance_of Ship, @cruiser
  end

  def test_name
    assert_equal 'Cruiser', @cruiser.name
  end

  def test_length
    assert_equal 3, @cruiser.length
  end

  def test_health
    assert_equal 3, @cruiser.health
  end

  def test_hit
    @cruiser.hit

    assert_equal 2, @cruiser.health
  end

  def test_sunk
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit

    assert_equal true, @cruiser.sunk
  end
end
