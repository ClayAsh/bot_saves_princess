require_relative 'grid'

class Bot 
  attr_reader :x,
              :y 
  def initialize(grid)
    @x = find_bot(grid)
    @y = find_bot(grid)
  end

  def find_bot(grid)
    (grid.size - 1) / 2
  end
end