class Robot
  attr_accessor :x, :y, :f

  def position
    {
      x: x,
      y: y,
      f: f
    }
  end
  
end
