require_relative 'grid'

class SavePrincess 
  attr_accessor :grid,
                :bot,
                :princess 

  def initialize(grid)
    @princess = grid.princess
    @bot      = grid.bot
    @grid = grid
    @moves = []
  end

  def find_path 
    index_column = @bot[0] - @princess[0] 
    if index_column.positive? 
      index_column.times do 
       @moves << "UP"
      end
    elsif index_column.negative? 
      (index_column * -1).times do
        @moves << "DOWN"
      end
    end 
    index_row = @bot[1] - @princess[1]
    if index_row.positive? 
    index_row.times do 
      @moves << "LEFT"
      end
    elsif index_row.negative? 
      (index_row * -1).times do
        @moves << "RIGHT"
      end
    end
    @moves
  end
end 