class Grid 
  attr_reader :size,
              :bot,
              :princess,
              :grid
  def initialize(size, bot_x, bot_y, grid)
    @size     = size 
    @bot      = [bot_x, bot_y] 
    @grid     = grid
    @princess = find_element('p')
  end

  def find_element(e) 
    coordinates = []
    @grid.each_with_index do |row, index|
      if row.include?(e)
        coordinates << index 
        coordinates << row.chars.index(e)
      end
    end
    coordinates
  end   
end

class SavePrincess
  attr_reader :bot,
              :princess

  def initialize(grid)
    @bot      = grid.bot
    @princess = grid.princess
  end

  def find_move 
    if @bot[0] != @princess[0]
      index_column = @bot[0] - @princess[0] 
      if index_column.positive? 
        print "UP"
      elsif index_column.negative? 
        print "DOWN"
      end 
    elsif @bot[1] != @princess[1] 
      index_row = @bot[1] - @princess[1]
      if index_row.positive? 
        print "LEFT"
      elsif index_row.negative? 
        print "RIGHT"
      end
    end 
  end
end

def nextMove(n,r,c,grid)
  new_grid = Grid.new(n,r,c,grid) 
  save_princess = SavePrincess.new(new_grid)
  save_princess.find_move
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)