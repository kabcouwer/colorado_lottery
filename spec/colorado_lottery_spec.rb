require './lib/contestant'
require './lib/game'
require './lib/colorado_lottery'
require 'rspec'

RSpec.describe ColoradoLottery do
  describe 'instantiation' do
    it 'exists' do
      lottery = ColoradoLottery.new

      expect(lottery).to be_a(ColoradoLottery)
    end

    it 'has readable attributes' do
      lottery = ColoradoLottery.new

      expect(lottery.registered_contestants).to eq({})
      expect(lottery.winners).to eq([])
      expect(lottery.current_contestants).to eq({})
    end
  end
end
