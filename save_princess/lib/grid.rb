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