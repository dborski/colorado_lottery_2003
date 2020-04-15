




# ### Iteration 1
#
# Use TDD to create a `Game` and `Contestant` class that respond to the following interaction pattern:
# A contestant is considered out of state if their state of residence is not Colorado.
#
# ```ruby
#require "./lib/contestant"
# #=> true
#
#require "./lib/game"
# #=> true
#
#pick_4 = Game.new('Pick 4', 2)
# #=> #<Game:0x007f96c296b7b0...>
#
#mega_millions = Game.new('Mega Millions', 5, true)
# #=> #<Game:0x007f96c2953278...>
#
#mega_millions.name
# #=> "Mega Millions"
#
#mega_millions.cost
# #=> 5
#
#mega_millions.national_drawing?
# #=> true
#
#pick_4.national_drawing?
# #=> false
#
#alexander = Contestant.new({first_name: 'Alexander',
#                                       last_name: 'Aigiades',
#                                       age: 28,
#                                       state_of_residence: 'CO',
#                                       spending_money: 10})
# #=> <Contestant:0x007ff87ac0a498...>
#
#alexander.full_name
# #=> "Alexander Aigiades"
#
#alexander.age
# #=> 28
#
#alexander.state_of_residence
# #=> "CO"
#
#alexander.spending_money
# #=> 10
#
#alexander.out_of_state?
# #=> false
#
#alexander.game_interests
# #=> []
#
#alexander.add_game_interest('Mega Millions')
#alexander.add_game_interest('Pick 4')
#
#alexander.game_interests
# => ["Mega Millions", "Pick 4"]
# ```
