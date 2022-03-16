# Reading user input
load 'robot.rb'
load 'action.rb'
robot = Robot.new
# r.x = 2
# puts r.x
loop do
  input = gets.chomp  

  next if input.empty?

  unless 'EXIT'.match?(input)
    Action.new.execute(robot, input)
    next
  end

  $stdout.print "Goodbye! \n"
  break
end