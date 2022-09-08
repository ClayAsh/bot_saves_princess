class Grid 
  attr_reader :size,
              :grid 
  def initialize(size, grid)
    #wrong grid size(2 >, > 100 && odd), princess not found, bot not found
    @size = size 
    @grid = grid
  end

  def find_princess 
    coordinates = []
    @grid.each_with_index do |row, index|
      if row.include?('p')
        coordinates << index 
        coordinates << row.chars.index('p')
      end
    end
    coordinates
  end 
end