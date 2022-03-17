class Action
  
  def execute(robot, command)
    cmd = command.split(" ").first.upcase
    case cmd
    when "PLACE"
      place(robot, command)
      robot.update_robot(true)
    when "MOVE"
       robot.in_place? ? move(robot) : invalid_input
    when "LEFT"
      robot.in_place? ? left(robot) : invalid_input
    when "RIGHT"
      robot.in_place? ? right(robot) : invalid_input
    when "REPORT"
      robot.in_place? ? report(robot) : invalid_input
    else
      invalid_input
    end
  end

  def place(robot, command)
    args = command.split(" ").last
    robot.x = args.split(",")[0].to_i
    robot.y = args.split(",")[1].to_i
    robot.f = args.split(",")[2]
  end

  def move(robot)
    x = robot.x
    y = robot.y
    f = robot.f
    y += 1 if f.match?('NORTH')
    y -= 1 if f.match?('SOUTH')
    x += 1 if f.match?('EAST')
    x -= 1 if f.match?('WEST')

    robot.x = x
    robot.y = y
    robot.f = f
    #CHECK IF IT DOESN'T FELL TO THE TABLE
  end

  def left(robot)
    robot.f = prev_option(robot.f)
  end

  def right(robot)
    robot.f = next_option(robot.f)
  end

  def report(robot)
    message = "Output: #{robot.x},#{robot.y},#{robot.f} \n"
    puts message
    robot.position
  end

  def invalid_input
    puts "Invalid input or the robot is not placed." 
  end

  private

  OPTIONS = %w[WEST NORTH EAST SOUTH].freeze


  # def place_valid?(command)
  #   q = command.split(" ").last
  #   return true unless q.count < 3 || q.count > 3 || !OPTIONS.include?(q[2])
  #   false
  # end

  def prev_option(direction)
    return unless OPTIONS.include?(direction)

    return OPTIONS.last if direction == OPTIONS.first

    i = OPTIONS.index { |e| e == direction }
    i -= 1

    OPTIONS.fetch(i)
  end

  def next_option(direction)
    return unless OPTIONS.include?(direction)

    return OPTIONS.first if direction == OPTIONS.last

    i = OPTIONS.index { |e| e == direction }
    i += 1

    OPTIONS.fetch(i)
  end
end