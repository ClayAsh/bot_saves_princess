require 'spec_helper'
require_relative '../lib/grid'

RSpec.describe Grid do 
  let(:grid) { Grid.new(5, 2, 3, ["-----", "-----", "p--m-", "-----", "-----"]) } 

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(grid).to be_a(Grid)
      expect(grid.size).to eq(5)
      expect(grid.bot).to eq([2, 3])
      expect(grid.princess).to eq([2, 0])
    end
  end

  describe 'find_element' do 
    it 'finds coordinates of princess' do 
      expect(grid.find_element('p')).to eq([2, 0])
    end
  end

  describe 'sad path' do 
    it 'returns error if grid size is over 100' do 
      expect { Grid.new(101, 2, 3, ["-----", "-----", "p--m-", "-----", "-----"]) }
    end

    it 'returns an error if grid size and grid do not match' do 
      expect {Grid.new(3, 2, 3, ["-----", "-----", "p--m-", "-----", "-----"])}.to raise_error(ArgumentError) 
    end

    it 'returns error if bot coordinates do not match grid' do 
      expect {Grid.new(3, 0, 0, ["-----", "-----", "p--m-", "-----", "-----"])}.to raise_error(ArgumentError)
    end
  end
end

