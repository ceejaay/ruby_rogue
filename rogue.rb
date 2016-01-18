require 'gosu'
require './player'
require './map'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Rogue"
    array = [["#", "#", "#", "#", "#"], ["#","#", "#", "#"], ["#"], ["#"], ["#"]]
    @map_array = []
#this is where we create all the map objects
    array.each_with_index do |value0, index0|
      value0.each_with_index do |value1, index1|
        @map_array << Map.new((index1 * 20), (index0 * 20), value1) if value1 == "#"
      end
    end


    @player = Player.new(100, 300)
    #@text = Gosu::Font.new(20)
    #@distance = Gosu::Font.new(20)
    #@map_test = Gosu::Font.new(20)
    #@map_coordinates_text = Gosu::Font.new(20)
  @map_array.each do |item|
   puts "This is the font thing = > #{item.tile}"
   puts item.icon
   puts item.x
   puts item.y
   end

  end

  def update
  end

  def button_down(id)
     case id
       when Gosu::KbLeft
         @map_array.each do |map_object|
           if map_object.solid?(@player.x - 20, @player.y)
           nil
           else
             @player.west
             break
           end
         end

       when Gosu::KbRight
         @map_array.each do |map_object|
           if map_object.solid?(@player.x + 20, @player.y)
             nil
             else
               @player.east
               break
             end
         end

       when Gosu::KbUp
         @map_array.each do |map_object|
           if map_object.solid?(@player.x, @player.y - 20)
             nil
             else
               @player.north
               break
             end
         end

       when Gosu::KbDown
         @map_array.each do |map_object|
           if map_object.solid?(@player.x, @player.y + 20)
             nil
             else
               @player.south
               break
             end
         end
       when Gosu::KbEscape
         close
     end
  end

  def draw
    @player.draw
    @map_array.each do |item|
#item is the map object
#tile is a method and attribute of the map class
 # same with icon the icon comes from what is in the array. Which is usually a '#' character.
#the item.x and item.y are the coordinates of the tiles. They come from the map array.
     item.tile.draw(item.icon, item.x, item.y, 0xff_ffff00)
    end
   # @text.draw("Player: X => #{@player.x} Y => #{@player.y}", 10, 30, 0xff_ffff00)
    #@distance.draw(" Distance between player and tile => #{Gosu::distance(@player.x, @player.y, @map.x, @map.y)}", 50, 50, 0xff_ffff00)
=begin
    if @map.solid?(@player.x - 20, @player.y)

      @map_test.draw("Collision => True", 10, 80, 0xff_ffff00)
    elsif @map.solid?(@player.x + 20, @player.y)
      @map_test.draw("Collision => True", 10, 80, 0xff_ffff00)
    elsif @map.solid?(@player.x, @player.y + 20)
      @map_test.draw("Collision => True", 10, 80, 0xff_ffff00)
    elsif @map.solid?(@player.x, @player.y - 20)
      @map_test.draw("Collision => True", 10, 80, 0xff_ffff00)
    else
      @map_test.draw("Collision => False", 10, 80, 0xff_ffff00)
    end
      @map_coordinates_text.draw("Map X => #{@map.x} Map Y => #{@map.y}", 300, 30, 0xff_ffff00)
  end
=end
end
end
window = GameWindow.new
window.show
