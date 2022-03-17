# Reading user input
# load 'robot.rb'
# load 'action.rb'
require_relative 'action'
require_relative 'table'
require_relative 'robot'
require_relative 'handle_input'

command = HandleInput.new(Robot.new, Table.new, Action.new)

puts "Options: PLACE X,Y,F; MOVE; LEFT; RIGHT; REPORT; EXIT\n"

loop do
  input = gets.chomp  

  next if input.empty?

  unless 'EXIT'.match?(input)
    command.execute(input)
    next
  end

  $stdout.print "Goodbye! \n"
  break
end