class ColoradoLottery

  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize()
    @registered_contestants = Hash.new { |hash, key| hash[key] = [] }
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(person_interested, game_interest)
    person_interested.age >= 18 && person_interested.game_interests.include?(game_interest.name)
  end

  def can_register?(person, game)
    interested_and_18?(person, game) && (game.national_drawing? || !person.out_of_state?)
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      @registered_contestants[game.name] << contestant
    end
  end

  def eligible_contestants(game)
    contestants = @registered_contestants.find_all do |key, value|
      key == game.name
    end.flatten
    contestants.shift
    contestants.find_all do |contestant|
      contestant.spending_money >= game.cost
    end
  end
end
