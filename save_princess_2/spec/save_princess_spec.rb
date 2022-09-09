require 'spec_helper'
require_relative '../lib/grid'
require_relative '../lib/save_princess'

RSpec.describe SavePrincess do 
  let(:grid) { Grid.new(5, 2, 3, ["-----", "-----", "p--m-", "-----", "-----"]) }  
  let(:grid2) { Grid.new(5, 2, 2, ["-----", "-----", "--m-p", "-----", "-----"]) }  
  let(:grid3) { Grid.new(5, 2, 2, ["-----", "--p--", "--m--", "-----", "-----"]) }  
  let(:grid4) { Grid.new(5, 2, 3, ["-----", "-----", "---m-", "---p-", "-----"]) }  
  let(:sp) { SavePrincess.new(grid) }
  let(:sp2) { SavePrincess.new(grid2) }
  let(:sp3) { SavePrincess.new(grid3) }
  let(:sp4) { SavePrincess.new(grid4) }

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(sp).to be_a(SavePrincess)
      expect(sp.bot).to eq(grid.bot)
      expect(sp.bot).to eq([2, 3])
      expect(sp.princess).to eq(grid.princess)
      expect(sp.princess).to eq([2, 0])
    end
  end

  describe 'find_move' do 
    it 'returns the first move to find the princess to the left' do 
      expect(sp.find_move).to eq("LEFT")
    end

    it 'returns the first move to find the princess to the right' do 
      expect(sp2.find_move).to eq("RIGHT")
    end

    it 'returns the first move to find the princess up' do 
      expect(sp3.find_move).to eq("UP")
    end

    it 'returns the first move to find the princess down' do 
      expect(sp4.find_move).to eq("DOWN")
    end
  end
end