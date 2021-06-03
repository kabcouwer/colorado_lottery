class Game
  attr_reader :name,
              :cost,
              :national_drawing
  def initialize(name, cost, national_drawing = false)
    @name = name
    @cost = cost
    @national_drawing = national_drawing
  end

  def national_drawing?
    if @national_drawing == true
      return true
    else
      return false
    end
  end
end
