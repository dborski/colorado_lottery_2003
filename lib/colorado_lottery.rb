class ColoradoLottery

  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = Hash.new { |hash, key| hash[key] = [] }
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && (!contestant.out_of_state? || game.national_drawing?)
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      @registered_contestants[game.name] << contestant
    end
  end

  def eligible_contestants(game)
    found_games = @registered_contestants.find_all {|game_name, contestants| game_name == game.name}
    eligible_contestants = []
    found_games.each do |game_name, contestants|
      contestants.each {|contestant| eligible_contestants << contestant if contestant.spending_money >= game.cost }
    end
    eligible_contestants
  end
end
