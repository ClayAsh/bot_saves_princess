require_relative 'grid'

class Bot 
  attr_reader :x,
              :y 
  def initialize(grid)
    @x = grid.find_element('m')[0]
    @y = grid.find_element('m')[1]
  end
end