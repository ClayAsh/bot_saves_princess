require 'spec_helper'
require_relative '../lib/princess'
require_relative '../lib/grid'

RSpec.describe Princess do 
  let(:grid) { Grid.new(3, ["---", "-m-", "p--"]) } 
  let(:princess) { Princess.new(grid) }

  describe 'initialize' do 
    it 'exists and has attributes' do 
      expect(princess).to be_a(Princess)
      expect(princess.x).to eq(2)
      expect(princess.y).to eq(0)
    end
  end
end