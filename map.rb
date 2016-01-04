require 'gosu'


class Map
    attr_accessor :x, :y

  def initialize(x, y)
    #@raw_map = File.readlines("media/map.txt").map {|lines| lines.chomp}
    @x = x
    @y = y
    @tile = Gosu::Font.new(20)

  end

  def draw
    @tile.draw("#", @x, @y, 0xff_fff00)
  end

  def solid?(x, y)
     y.between?(@y, @y + 20) 
=begin
     if x.between?(@x, @x + 20.0) 
       return true
     elsif y.between?(@y, @y + 20)
       return true
     end
=end
#this one evaluates half of it.
      #@x.between?(x, x + 20) 
#this one keeps it from going south.
     # @y.between?(y, y + 20) 
     #this one evalutes the other half.
#this one will keep it from going west or left
      #x.between?(@x, @x + 20) 
#this blocks it when you want to go north
      #y.between?(@y, @y + 20) 
  end 
end
