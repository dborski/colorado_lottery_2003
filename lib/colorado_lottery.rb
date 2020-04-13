require 'date'

class ColoradoLottery

  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = Hash.new { |hash, key| hash[key] = [] }
    @winners = []
    @current_contestants = Hash.new { |hash, key| hash[key] = [] }
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
    eligible_contestants = []
    @registered_contestants.each do |key, value|
      if key == game.name
        eligible_contestants = value.find_all { |value| value.spending_money >= game.cost}
      end
    end
    eligible_contestants
  end

  def charge_contestants(game)
    eligible_contestants(game).each do |contestant|
      @current_contestants[game] << contestant.full_name
      contestant.spending_money -= game.cost
    end
  end

  def draw_winners
    @current_contestants.each do |key, value|
      @winners << {value.shuffle.first => key}
    end
    d = DateTime.now
    d.strftime("%Y-%m-%d")
    require "pry"; binding.pry
  end
end
