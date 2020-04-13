class Contestant

  attr_accessor :spending_money
  attr_reader :first_name, :last_name, :age, :state_of_residence,
              :game_interests

  def initialize(init_hash)
    @first_name = init_hash[:first_name]
    @last_name = init_hash[:last_name]
    @age = init_hash[:age]
    @state_of_residence = init_hash[:state_of_residence]
    @spending_money = init_hash[:spending_money]
    @game_interests = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def out_of_state?
    @state_of_residence != "CO"
  end

  def add_game_interest(game_interest)
    @game_interests << game_interest
  end
end
