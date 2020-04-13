require 'minitest/autorun'
require 'minitest/pride'
require "./lib/contestant"
require "./lib/game"
require "./lib/colorado_lottery"

class ColoradoLotteryTest < Minitest::Test

  def test_it_exists
    lottery = ColoradoLottery.new

    assert_instance_of ColoradoLottery, lottery
  end

  def test_registered_contenstants_is_empty_hash
    lottery = ColoradoLottery.new

    assert_equal ({}), lottery.registered_contestants
  end

  def test_winners_is_empty_array
    lottery = ColoradoLottery.new

    assert_equal [], lottery.winners
  end

  def test_current_contestants_is_empty_hash
    lottery = ColoradoLottery.new

    assert_equal ({}), lottery.current_contestants
  end

  def test_interested_and_18?
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    alexander = Contestant.new({
                            first_name: 'Alexander',
                            last_name: 'Aigades',
                            age: 28,
                            state_of_residence: 'CO',
                            spending_money: 10})
    benjamin = Contestant.new({
                            first_name: 'Benjamin',
                         last_name: 'Franklin',
                            age: 17,
                            state_of_residence: 'PA',
                            spending_money: 100})
    frederick = Contestant.new({
                            first_name:  'Frederick',
                            last_name: 'Douglas',
                            age: 55,
                            state_of_residence: 'NY',
                            spending_money: 20})
    winston = Contestant.new({
                          first_name: 'Winston',
                          last_name: 'Churchill',
                          age: 18,
                          state_of_residence: 'CO',
                          spending_money: 5})

    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')

    assert_equal true,  lottery.interested_and_18?(alexander, pick_4)
    assert_equal false, lottery.interested_and_18?(benjamin, mega_millions)
    assert_equal false, lottery.interested_and_18?(alexander, cash_5)
  end

  def test_can_register_for_game
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    alexander = Contestant.new({
                            first_name: 'Alexander',
                            last_name: 'Aigades',
                            age: 28,
                            state_of_residence: 'CO',
                            spending_money: 10})
    benjamin = Contestant.new({
                            first_name: 'Benjamin',
                            last_name: 'Franklin',
                            age: 17,
                            state_of_residence: 'PA',
                            spending_money: 100})
    frederick = Contestant.new({
                            first_name:  'Frederick',
                            last_name: 'Douglas',
                            age: 55,
                            state_of_residence: 'NY',
                            spending_money: 20})
    winston = Contestant.new({
                          first_name: 'Winston',
                          last_name: 'Churchill',
                          age: 18,
                          state_of_residence: 'CO',
                          spending_money: 5})

    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')

    assert_equal true, lottery.can_register?(alexander, pick_4)
    assert_equal false, lottery.can_register?(alexander, cash_5)
    assert_equal true, lottery.can_register?(frederick, mega_millions)
    assert_equal false, lottery.can_register?(benjamin, mega_millions)
    assert_equal false, lottery.can_register?(frederick, cash_5)
  end

  def test_can_register_for_game
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    alexander = Contestant.new({
                            first_name: 'Alexander',
                            last_name: 'Aigades',
                            age: 28,
                            state_of_residence: 'CO',
                            spending_money: 10})
    benjamin = Contestant.new({
                            first_name: 'Benjamin',
                            last_name: 'Franklin',
                            age: 17,
                            state_of_residence: 'PA',
                            spending_money: 100})
    frederick = Contestant.new({
                            first_name:  'Frederick',
                            last_name: 'Douglas',
                            age: 55,
                            state_of_residence: 'NY',
                            spending_money: 20})
    winston = Contestant.new({
                          first_name: 'Winston',
                          last_name: 'Churchill',
                          age: 18,
                          state_of_residence: 'CO',
                          spending_money: 5})

    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')

    lottery.register_contestant(alexander, pick_4)

    expected1 = {"Pick 4"=> [alexander]}
    assert_equal expected1, lottery.registered_contestants

    lottery.register_contestant(alexander, mega_millions)

    expected2 = {"Pick 4"=> [alexander], "Mega Millions"=> [alexander]}
    assert_equal expected2, lottery.registered_contestants

    lottery.register_contestant(frederick, mega_millions)
    lottery.register_contestant(winston, cash_5)
    lottery.register_contestant(winston, mega_millions)

    expected3 = {"Pick 4"=> [alexander], "Mega Millions" => [alexander, frederick, winston], "Cash 5" => [winston]}
    assert_equal expected3, lottery.registered_contestants

   grace = Contestant.new({
                        first_name: 'Grace',
                        last_name: 'Hopper',
                        age: 20,
                        state_of_residence: 'CO',
                        spending_money: 20})

   grace.add_game_interest('Mega Millions')
   grace.add_game_interest('Cash 5')
   grace.add_game_interest('Pick 4')
   lottery.register_contestant(grace, mega_millions)
   lottery.register_contestant(grace, cash_5)
   lottery.register_contestant(grace, pick_4)

   expected4 = {"Pick 4"=> [alexander, grace], "Mega Millions" => [alexander, frederick, winston, grace], "Cash 5" => [winston, grace]}
   assert_equal expected4, lottery.registered_contestants
  end

  def test_can_register_for_game
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    alexander = Contestant.new({
                            first_name: 'Alexander',
                            last_name: 'Aigades',
                            age: 28,
                            state_of_residence: 'CO',
                            spending_money: 10})
    benjamin = Contestant.new({
                            first_name: 'Benjamin',
                            last_name: 'Franklin',
                            age: 17,
                            state_of_residence: 'PA',
                            spending_money: 100})
    frederick = Contestant.new({
                            first_name:  'Frederick',
                            last_name: 'Douglas',
                            age: 55,
                            state_of_residence: 'NY',
                            spending_money: 20})
    winston = Contestant.new({
                          first_name: 'Winston',
                          last_name: 'Churchill',
                          age: 18,
                          state_of_residence: 'CO',
                          spending_money: 5})

    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')

    assert_equal true, lottery.can_register?(alexander, pick_4)
    assert_equal false, lottery.can_register?(alexander, cash_5)
    assert_equal true, lottery.can_register?(frederick, mega_millions)
    assert_equal false, lottery.can_register?(benjamin, mega_millions)
    assert_equal false, lottery.can_register?(frederick, cash_5)
  end

  def test_eligible_contestants
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    alexander = Contestant.new({
                            first_name: 'Alexander',
                            last_name: 'Aigades',
                            age: 28,
                            state_of_residence: 'CO',
                            spending_money: 10})
    benjamin = Contestant.new({
                            first_name: 'Benjamin',
                            last_name: 'Franklin',
                            age: 17,
                            state_of_residence: 'PA',
                            spending_money: 100})
    frederick = Contestant.new({
                            first_name:  'Frederick',
                            last_name: 'Douglas',
                            age: 55,
                            state_of_residence: 'NY',
                            spending_money: 20})
    winston = Contestant.new({
                          first_name: 'Winston',
                          last_name: 'Churchill',
                          age: 18,
                          state_of_residence: 'CO',
                          spending_money: 5})
    grace = Contestant.new({
                         first_name: 'Grace',
                         last_name: 'Hopper',
                         age: 20,
                         state_of_residence: 'CO',
                         spending_money: 20})

    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    grace.add_game_interest('Mega Millions')
    grace.add_game_interest('Cash 5')
    grace.add_game_interest('Pick 4')

    lottery.register_contestant(alexander, pick_4)
    lottery.register_contestant(alexander, mega_millions)
    lottery.register_contestant(frederick, mega_millions)
    lottery.register_contestant(winston, cash_5)
    lottery.register_contestant(winston, mega_millions)
    lottery.register_contestant(grace, mega_millions)
    lottery.register_contestant(grace, cash_5)
    lottery.register_contestant(grace, pick_4)


     assert_equal [alexander, grace], lottery.eligible_contestants(pick_4)
     assert_equal [winston, grace], lottery.eligible_contestants(cash_5)
     assert_equal [alexander, frederick, winston, grace], lottery.eligible_contestants(mega_millions)
  end

  def test_eligible_contestants
    skip
    lottery = ColoradoLottery.new
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    alexander = Contestant.new({
                            first_name: 'Alexander',
                            last_name: 'Aigades',
                            age: 28,
                            state_of_residence: 'CO',
                            spending_money: 10})
    benjamin = Contestant.new({
                            first_name: 'Benjamin',
                            last_name: 'Franklin',
                            age: 17,
                            state_of_residence: 'PA',
                            spending_money: 100})
    frederick = Contestant.new({
                            first_name:  'Frederick',
                            last_name: 'Douglas',
                            age: 55,
                            state_of_residence: 'NY',
                            spending_money: 20})
    winston = Contestant.new({
                          first_name: 'Winston',
                          last_name: 'Churchill',
                          age: 18,
                          state_of_residence: 'CO',
                          spending_money: 5})
    grace = Contestant.new({
                         first_name: 'Grace',
                         last_name: 'Hopper',
                         age: 20,
                         state_of_residence: 'CO',
                         spending_money: 20})

    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    frederick.add_game_interest('Mega Millions')
    winston.add_game_interest('Cash 5')
    winston.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')
    grace.add_game_interest('Mega Millions')
    grace.add_game_interest('Cash 5')
    grace.add_game_interest('Pick 4')

    lottery.register_contestant(alexander, pick_4)
    lottery.register_contestant(alexander, mega_millions)
    lottery.register_contestant(frederick, mega_millions)
    lottery.register_contestant(winston, cash_5)
    lottery.register_contestant(winston, mega_millions)
    lottery.register_contestant(grace, mega_millions)
    lottery.register_contestant(grace, cash_5)
    lottery.register_contestant(grace, pick_4)

    lottery.charge_contestants(cash_5)
    expected = {cash_5 => ["Winston Churchill", "Grace Hopper"]}
    lottery.current_contestants
     #=> {#<Game:0x007f8a32295360...> => ["Winston Churchill", "Grace Hopper"]}
  end
end


# ### Iteration 3
#
# - Use TDD to update your `Lottery` class so that it responds to the following interaction pattern.
# - To save time, we will keep the same setup from iteration 2 with all of the same
# objects and interests, plus we will add one additional contestant with interests
# at a specific point in the interaction.
# - We will only register contestants that `#can_register?`
# - `#eligible_contestants` is a list of all the contestants who have been registered
 # to play a given game and that have more spending_money than the cost.
# - current_contestants are lists of contestant names who have been charged,
# organized by game.
#
# lottery.charge_contestants(cash_5)
#
# lottery.current_contestants
# #=> {#<Game:0x007f8a32295360...> => ["Winston Churchill", "Grace Hopper"]}
#
# grace.spending_money
# #=> 19
#
# winston.spending_money
# #=> 4
#
# lottery.charge_contestants(mega_millions)
#
# lottery.current_contestants
# #=> {#<Game:0x007f8a32295360...> => ["Winston Churchill", "Grace Hopper"],
#  #<Game:0x007f8a322ad5a0...> => ["Alexander Aigades", "Frederick Douglas", "Grace Hopper"]}
#
# grace.spending_money
# #=> 14
#
# winston.spending_money
# #=> 4
#
# alexander.spending_money
# #=> 5
#
# frederick.spending_money
# #=> 15
#
# lottery.charge_contestants(pick_4)
#
# lottery.current_contestants
# #=> {#<Game:0x007f8a32295360...> => ["Winston Churchill", "Grace Hopper"],
# #<Game:0x007f8a322ad5a0...> => ["Alexander Aigades", "Frederick Douglas", "Grace Hopper"],
# #<Game:0x007f8a317b5e40...> => ["Alexander Aigades", "Grace Hopper"]}
