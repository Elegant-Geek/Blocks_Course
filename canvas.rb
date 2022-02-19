# ***************** Canvas class WITHOUT Block Initializer built in *****************
# (this means you cannot pass in a block of attributes that override defaults, you override them manually.)
# (therefore you must type in the attributes manually one by one as shown on line 34)

class Canvas
  attr_accessor :width, :height, :color

  def initialize
    @width = 100
    @height = 100
    @color = :black
  end

  def draw_rect(x, y, width, height)
    # draws a rectangle
  end

  def to_s
    "#{@width}x#{@height} #{@color} canvas"
  end
end

# example of new canvas with defaults
puts "example of new canvas WITH DEFAULTS:"

canvas = Canvas.new
puts canvas
p canvas #shows all the variables inside

# example of overriding defaults
puts "example of overriding defaults:"
canvas = Canvas.new
canvas.width = 250
canvas.height = 500
canvas.color = :blue
puts canvas
p canvas


