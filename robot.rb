class Robot
  attr_accessor :x, :y, :f, :place
  
  def initialize
    @place = false
  end 

  def position
    {
      x: x,
      y: y,
      f: f
    }
  end

  def in_place?
    @place
  end

  def update_robot(new_place)
    @place = new_place
  end
end
