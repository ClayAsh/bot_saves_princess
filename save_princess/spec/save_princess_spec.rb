require 'spec_helper'
require_relative '../lib/bot'
require_relative '../lib/princess'
require_relative '../lib/grid'
require_relative '../lib/save_princess'

RSpec.describe SavePrincess do 
  let(:grid) { Grid.new(3, ["---", "-m-", "p--"]) } 
  let(:grid2) { Grid.new(5, ["p----", "-----", "--m--", "-----", "-----"]) } 
  let(:grid3) { Grid.new(5, ["----p", "-----", "--m--", "-----", "-----"]) } 

  let(:sp) { SavePrincess.new(grid) }
  let(:sp2) { SavePrincess.new(grid2) }
  let(:sp3) { SavePrincess.new(grid3) }

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(sp).to be_a(SavePrincess)
      expect(sp.bot).to eq([1, 1])
      expect(sp.princess).to eq([2, 0])

      expect(sp2.bot).to eq([2, 2])
      expect(sp2.princess).to eq([0, 0])
    end
  end

  describe 'find path' do 
    it 'returns array of movements to find princess for grid of 3 with DOWN LEFT' do 
      expect(sp.find_path).to eq(["DOWN", "LEFT"])
    end

    it 'returns array of movements to find princess for grid of 5 with UP LEFT' do 
      expect(sp2.find_path).to eq(["UP", "UP", "LEFT", "LEFT"])
    end

    it 'returns array of movements to find princess for grid of 5 with UP RIGHT' do 
      expect(sp3.find_path).to eq(["UP", "UP", "RIGHT", "RIGHT"])
    end
  end
end