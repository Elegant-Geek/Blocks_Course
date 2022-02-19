# ***************** Canvas class with the Block Initializer built in *****************
# The method runs with or without a block. In this case, a default 
# object is created and the attributes are assigned new values after the fact.

class Canvas
    attr_accessor :width, :height, :color
  
    def initialize

      @width = 100
      @height = 100
      @color = :black
      yield self if block_given? # the only line that was added!
    end
  
    def draw_rect(x, y, width, height)
      # draws a rectangle
    end
  
    def to_s
      "#{@width}x#{@height} #{@color} canvas"
    end
  end
# here is a sample block that passes in and overwrites any defaults for initialization
canvas = Canvas.new do |c|
    c.width = 800
    c.height = 600
    c.color = :green
   end

puts canvas
p canvas