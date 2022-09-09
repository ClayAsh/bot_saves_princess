require_relative 'grid'

class Princess 
  attr_reader :x,
              :y
  def initialize(grid)
    @x = grid.find_element('p')[0]
    @y = grid.find_element('p')[1]
  end
end