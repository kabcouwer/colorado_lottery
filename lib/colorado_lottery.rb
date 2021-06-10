class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants
  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(person, game)
    if person.age >= 18 && person.game_interests.include?(game.name)
      true
    else
      false
    end
  end

  def can_register?(person, game)
    if interested_and_18?(person, game) == true && game.national_drawing? == true
      true
    elsif interested_and_18?(person, game) == true && person.out_of_state? == false
      true
    else
      false
    end
  end

  def register_contestant(person, game)
    person_array = []
    if can_register?(person, game) == true &&
      registered_contestants[game.name] == nil
      registered_contestants[game.name] = person_array
      person_array << person
    else
      can_register?(person, game) == true
      registered_contestants[game.name] << person
    end
  end

  def eligible_contestants(game)
    registered_contestants[game.name].find_all do |person|
      person.spending_money >= game.cost
    end
  end

  def charge_contestants(game)
    person_array = []
    eligible_contestants(game).map do |person|
      if current_contestants[game] != nil
        person_array << person.full_name
        person.charge(game)
      else
        current_contestants[game] = person_array
        person_array << person.full_name
        person.charge(game)
      end
    end
  end

end
