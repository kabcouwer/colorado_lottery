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
end
