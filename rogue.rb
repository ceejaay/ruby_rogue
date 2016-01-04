require 'gosu'
require './player'
require './map'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Rogue"
    @map = Map.new(100, 100)
    @player = Player.new(100, 200)
    @text = Gosu::Font.new(20)
    @distance = Gosu::Font.new(20)
    @map_test = Gosu::Font.new(20)
  end

  def update
  end

  def button_down(id)
       
     @player.west if id == Gosu::KbLeft
     @player.east if id == Gosu::KbRight
     @player.north if id == Gosu::KbUp
     @player.south if id == Gosu::KbDown
     close if id == Gosu::KbEscape 
  end

  def draw
    @player.draw
    @map.draw
    @text.draw("Player: X => #{@player.x} Y => #{@player.y}", 10, 30, 0xff_ffff00)
    @distance.draw("#{Gosu::distance(@player.x, @player.y, @map.x, @map.y)}", 50, 50, 0xff_ffff00)
    if @map.solid?(@player.x, @player.y)
      @map_test.draw("True", 70, 70, 0xff_ffff00)
    else
      @map_test.draw("False", 70, 70, 0xff_ffff00)
    end

  end
end

window = GameWindow.new
window.show
