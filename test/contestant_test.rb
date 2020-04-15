require 'minitest/autorun'
require 'minitest/pride'
require "./lib/game"
require "./lib/contestant"

class ContestantTest < Minitest::Test

  def setup
    @alexander = Contestant.new({first_name: 'Alexander',
                                           last_name: 'Aigiades',
                                           age: 28,
                                           state_of_residence: 'CO',
                                           spending_money: 10})
  end

  def test_it_exists
    assert_instance_of Contestant, @alexander
  end

  def test_it_has_readable_attributes
    assert_equal "Alexander", @alexander.first_name
    assert_equal "Aigiades", @alexander.last_name
    assert_equal 28, @alexander.age
    assert_equal 'CO', @alexander.state_of_residence
    assert_equal 10, @alexander.spending_money
  end

  def test_full_name
    assert_equal "Alexander Aigiades", @alexander.full_name
  end

  def test_out_of_state
    assert_equal false, @alexander.out_of_state?
  end

  def test_has_no_game_interests_by_default
    assert_equal [], @alexander.game_interests
  end

  def test_can_add_game_interests
    @alexander.add_game_interest('Mega Millions')
    @alexander.add_game_interest('Pick 4')

    assert_equal ["Mega Millions", "Pick 4"], @alexander.game_interests
  end
end
