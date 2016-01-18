require 'gosu'


class Map
    attr_accessor :x, :y, :icon, :tile

  def initialize(x, y, icon)
    #@raw_map = File.readlines("media/map.txt").map {|lines| lines.chomp}
    @x = x
    @y = y
    @icon = icon
    @tile = Gosu::Font.new(20)
  end

  def draw
   # @tile.draw(@icon, @x, @y, 0xff_fff00)
  end

  def solid?(x, y)
   if (@x/20 == x/20 && @y/20 == y/20)
     return true
   else
     return false
   end

  end
end
