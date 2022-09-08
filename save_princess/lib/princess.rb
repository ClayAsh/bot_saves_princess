require_relative 'grid'

class Princess 
  attr_reader :x,
              :y
  def initialize(grid)
    @x = grid.find_princess[0]
    @y = grid.find_princess[1]
  end
end