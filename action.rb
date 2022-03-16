class Action
  
  def execute(robot, command)
    cmd = command.split(" ").first.upcase
    case cmd
    when "PLACE"
      place(robot, command)
    when "MOVE"
      move(robot)
    when "LEFT"
      left(robot)
    when "RIGHT"
      right(robot)
    when "REPORT"
      report(robot)
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
    $stdout.print message
    robot.position
  end

  private

  OPTIONS = %w[WEST NORTH EAST SOUTH].freeze

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