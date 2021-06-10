require 'rspec'
require './lib/game'
require './lib/contestant'
require './lib/colorado_lottery'

RSpec.describe ColoradoLottery do
  before :each do
    @lottery = ColoradoLottery.new
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @alexander = Contestant.new({
                                  first_name: 'Alexander',
                                  last_name: 'Aigades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10
                                })
    @benjamin = Contestant.new({
                                  first_name: 'Benjamin',
                                  last_name: 'Franklin',
                                  age: 17,
                                  state_of_residence: 'PA',
                                  spending_money: 100
                                })
    @frederick = Contestant.new({
                                  first_name:  'Frederick',
                                  last_name: 'Douglas',
                                  age: 55,
                                  state_of_residence: 'NY',
                                  spending_money: 20
                                })
    @winston = Contestant.new({
                                  first_name: 'Winston',
                                  last_name: 'Churchill',
                                  age: 18,
                                  state_of_residence: 'CO',
                                  spending_money: 5
                                })
  end

  describe 'instantiation' do
    it 'exists' do
      expect(@lottery).to be_a(ColoradoLottery)
    end

    it 'has readable attributes' do
      expect(@lottery.registered_contestants).to eq({})
      expect(@lottery.winners).to eq([])
      expect(@lottery.current_contestants).to eq({})
    end
  end

  describe 'methods' do
    it 'can find if a person is interested and 18+' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')

      expect(@lottery.interested_and_18?(@alexander, @pick_4)).to eq(true)
      expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to eq(false)
      expect(@lottery.interested_and_18?(@alexander, @cash_5)).to eq(false)
    end

    it 'can find if someone can register' do
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')

      expect(@lottery.can_register?(@alexander, @pick_4)).to eq(true)
      expect(@lottery.can_register?(@alexander, @cash_5)).to eq(false)
      expect(@lottery.can_register?(@frederick, @mega_millions)).to eq(true)
      expect(@lottery.can_register?(@benjamin, @mega_millions)).to eq(false)
      expect(@lottery.can_register?(@frederick, @cash_5)).to eq(false)
    end

  end
end
