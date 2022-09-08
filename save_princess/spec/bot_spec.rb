require_relative '../lib/bot/'
require 'rspec'

RSpec.describe Bot do 
  let(:grid) { Grid.new(3, ["---", "-m-", "p--"]) } 
  let(:bot) { Bot.new(grid) }

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(bot).to be_a(Bot)
      expect(bot.x).to eq(1)
      expect(bot.y).to eq(1)
    end
  end
end