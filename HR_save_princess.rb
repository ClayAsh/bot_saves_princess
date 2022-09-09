class Grid 
  attr_reader :size,
              :grid,
              :princess,
              :bot

  def initialize(size, grid)
    raise ArgumentError, "Please enter an odd number between 3 & 100" unless size >= 3 && size <= 100
    raise ArgumentError, "Please enter an odd number" unless size.odd? == true 
    raise ArgumentError, "Please enter the correct number of columns for your grid size" unless grid.all? {|e| e.length == size} == true
   
    @size = size 
    @grid = grid
    @bot = find_element('m')
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

def displayPathtoPrincess(n,grid)
  new_grid = Grid.new(n, grid)
  new_game = SavePrincess.new(new_grid)
  new_game.find_path.each do |e|
    print e.concat("\n")
  end
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
