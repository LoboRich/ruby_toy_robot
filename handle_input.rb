class HandleInput
    attr_accessor :robot, :table, :action

    def initialize(robot, table, action)
        @robot = robot
        @table = table
        @action = action
    end

    def execute(command)
        action.execute(robot, command)
    end
end