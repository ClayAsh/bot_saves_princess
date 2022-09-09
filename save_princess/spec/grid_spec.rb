require 'spec_helper'
require_relative '../lib/grid'

RSpec.describe Grid do 
  let(:grid) { Grid.new(3, ["---", "-m-", "p--"]) } 

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(grid).to be_a(Grid)
      expect(grid.size).to eq(3)
      expect(grid.grid).to eq(["---", "-m-", "p--"])
    end
  end
  
  describe 'find_element' do 
    it 'can return princess coordinates' do 
      expect(grid.find_element('p')).to eq([2, 0])
    end

    it 'can return bot coordinates' do 
      expect(grid.find_element('m')).to eq([1, 1])
    end
  end
  
  describe 'sad path' do 
    it 'returns an error if grid size is greater than 100' do 
      expect {Grid.new(101, ["---", "-m-", "p--"])}.to raise_error(ArgumentError)
    end

    it 'returns an error if grid size is less than 3' do 
      expect {Grid.new(1, ["-", "m", "p"])}.to raise_error(ArgumentError)
    end
    
    it 'returns an error if grid size is even' do 
      expect {Grid.new(4, ["----", "-m--", "p---"])}.to raise_error(ArgumentError)
    end
    
    it 'returns an error if grid size and grid do not match' do 
      expect {Grid.new(3, ["-----", "--m--", "p----"])}.to raise_error(ArgumentError)
    end

    it 'doesnt return error for correct size grids over 3' do 
      expect { Grid.new(5, ["-----", "-----", "--m--","-----", "p----"]) }.not_to raise_error
    end
  end
end


