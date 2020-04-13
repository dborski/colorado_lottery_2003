require 'minitest/autorun'
require 'minitest/pride'
require "./lib/contestant"
require "./lib/game"
require "./lib/colorado_lottery"

class ColoradoLotteryTest < Minitest::Test

  def setup
    @lottery = ColoradoLottery.new
  end

  def test_it_exists
    assert_instance_of ColoradoLottery, @lottery
  end

  def test_it_has_no_registered_contestants
    assert_equal ({}), @lottery.registered_contestants
  end

  def test_it_has_no_winners
    assert_equal [], @lottery.winners
  end

  def test_it_has_no_current_contestants
    assert_equal ({}), @lottery.current_contestants
  end
end









# ### Iteration 2
#
# Use TDD to create a ColoradoLottery class that responds to the following interaction pattern.
#
# - A contestant #can_register? if they are interested in the game, 18 years of age or older, and they are either a Colorado resident or this is a national game
#
# ```ruby
# pry(main)> require "./lib/contestant"
# #=> true
#
# pry(main)> require "./lib/game"
# #=> true
#
# pry(main)> require "./lib/colorado_lottery"
# #=> true
#
# pry(main)> lottery = ColoradoLottery.new
# #=> #<ColoradoLottery:0x007f8a3250c440...>
#
# pry(main)> lottery.registered_contestants
# #=> {}
#
# pry(main)> lottery.winners
# #=> []
#
# pry(main)> lottery.current_contestants
# #=> {}
#
# pry(main)> pick_4 = Game.new('Pick 4', 2)
# #=> #<Game:0x007f8a317b5e40...>
#
# pry(main)> mega_millions = Game.new('Mega Millions', 5, true)
# #=> #<Game:0x007f8a322ad5a0...>
#
# pry(main)> cash_5 = Game.new('Cash 5', 1)
# #=> #<Game:0x007f8a32295360...>
#
# pry(main)> alexander = Contestant.new({
#                        first_name: 'Alexander',
#                        last_name: 'Aigades',
#                        age: 28,
#                        state_of_residence: 'CO',
#                        spending_money: 10})
# #=> #<Contestant:0x007f8a3251c390...>
#
# pry(main)> benjamin = Contestant.new({
#                        first_name: 'Benjamin',
#                        last_name: 'Franklin',
#                        age: 17,
#                        state_of_residence: 'PA',
#                        spending_money: 100})
# #=> #<Contestant:0x007f8a30383350...>
#
# pry(main)> frederick = Contestant.new({
#                        first_name:  'Frederick',
#                        last_name: 'Douglas',
#                        age: 55,
#                        state_of_residence: 'NY',
#                        spending_money: 20})
# #=> #<Contestant:0x007f8a325a6c98...>
#
# pry(main)> winston = Contestant.new({
#                      first_name: 'Winston',
#                      last_name: 'Churchill',
#                      age: 18,
#                      state_of_residence: 'CO',
#                      spending_money: 5})
# #=> #<Contestant:0x007f8a33092c10...>
#
# pry(main)> alexander.add_game_interest('Pick 4')
#
# pry(main)> alexander.add_game_interest('Mega Millions')
#
# pry(main)> frederick.add_game_interest('Mega Millions')
#
# pry(main)> winston.add_game_interest('Cash 5')
#
# pry(main)> winston.add_game_interest('Mega Millions')
#
# pry(main)> benjamin.add_game_interest('Mega Millions')
#
# pry(main)> lottery.interested_and_18?(alexander, pick_4)
# #=> true
#
# pry(main)> lottery.interested_and_18?(benjamin, mega_millions)
# #=> false
#
# pry(main)> lottery.interested_and_18?(alexander, cash_5)
# #=> false
#
# pry(main)> lottery.can_register?(alexander, pick_4)
# #=> true
#
# pry(main)> lottery.can_register?(alexander, cash_5)
# #=> false
#
# pry(main)> lottery.can_register?(frederick, mega_millions)
# #=> true
#
# pry(main)> lottery.can_register?(benjamin, mega_millions)
# #=> false
#
# pry(main)> lottery.can_register?(frederick, cash_5)
# #=> false
# ```
