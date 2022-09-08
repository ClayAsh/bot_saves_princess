require_relative 'grid'

class Bot 
  attr_reader :x,
              :y 
  def initialize(grid)
    @x = bot_coords(grid)
    @y = bot_coords(grid)
  end

  def bot_coords(grid)
    (grid.size - 1) / 2
  end
end