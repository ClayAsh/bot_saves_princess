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

  # def place_princess(size, bot)
  #    princess = []
  #   2.times do 
  #     princess << rand(0..(size - 1))  
  #   end 
  #   if princess != bot 
  #     @princess = princess 
  #   else 
  #     place_princess(size, bot)
  #   end 
  # end
end