require_relative '../lib/grid'
require 'rspec'

RSpec.describe Grid do 
  describe 'initialize' do 
    it 'exists and has attributes' do 
      grid = Grid.new(3, ["---", "-m-", "p--"])

      expect(grid).to be_a(Grid)
      expect(grid.size).to eq(3)
      expect(grid.grid).to eq(["---", "-m-", "p--"])
    end
  end
end


