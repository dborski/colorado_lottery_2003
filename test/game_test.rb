require 'minitest/autorun'
require 'minitest/pride'
require "./lib/game"

class GameTest < Minitest::Test

  def setup
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  def test_it_exists
    assert_instance_of Game, @pick_4
  end

  def test_it_has_readable_attributes
    assert_equal "Pick 4", @pick_4.name
    assert_equal 2, @pick_4.cost
  end

  def test_it_is_national_drawing
    assert_equal false, @pick_4.national_drawing?
    assert_equal true, @mega_millions.national_drawing?
  end
end
