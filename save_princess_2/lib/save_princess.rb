require_relative 'grid'

class SavePrincess
  attr_reader :bot,
              :princess

  def initialize(grid)
    @bot      = grid.bot
    @princess = grid.princess
  end

  def find_move 
    if @bot[0] != @princess[0]
      find_vertical_move  
    elsif @bot[1] != @princess[1] 
      find_horizontal_move
    end 
  end

  def find_vertical_move
    index_column = @bot[0] - @princess[0] 
    if index_column.positive? 
      p "UP"
    elsif index_column.negative? 
      p "DOWN"
    end 
  end

  def find_horizontal_move
    index_row = @bot[1] - @princess[1]
    if index_row.positive? 
      p "LEFT"
    elsif index_row.negative? 
      p "RIGHT"
    end
  end
end