require_relative '../lib/grid'
require 'rspec'

RSpec.describe Grid do 
  let(:grid) { Grid.new(3, ["---", "-m-", "p--"]) } 

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(grid).to be_a(Grid)
      expect(grid.size).to eq(3)
      expect(grid.grid).to eq(["---", "-m-", "p--"])
    end
  end

  describe '.find_princess' do 
    it 'can return princess coordinates' do 
      expect(grid.find_princess).to eq([2, 0])
    end
  end
end


