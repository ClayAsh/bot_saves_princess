require 'spec_helper'
require_relative '../lib/grid'

RSpec.describe Grid do 
  let(:grid) { Grid.new(3, [2, 3]) } 

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(grid).to be_a(Grid)
      expect(grid.size).to eq(3)
      expect(grid.bot).to eq([2, 3])
      expect(grid.princess).to_not eq(grid.bot)
    end
  end

  describe 'place princess' do 
    it 'sets the value of princess attribute' do 
      expect(grid.place_princess(3, [2, 3])).to be_a(Array)
      expect(grid.place_princess(3, [2, 3])).to_not be([])
    end
  end
end