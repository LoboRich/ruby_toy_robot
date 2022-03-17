require 'rspec'
require_relative '../robot'
require_relative '../action'

describe 'Toy Robot' do
    describe 'action' do
        let(:robot) { Robot.new }
        let(:action) { Action.new }

        it 'performs PLACE' do 
            place = action.execute(robot, 'PLACE 1,2,NORTH')
            expect(robot.position).to eq({x: 1, y: 2, f: 'NORTH'})
        end

        it 'performs LEFT' do 
            place = action.execute(robot, 'PLACE 1,3,NORTH')
            move = action.execute(robot, 'LEFT')
            expect(robot.position).to eq({x: 1, y: 3, f: 'WEST'})
        end

        it 'performs RIGHT' do 
            place = action.execute(robot, 'PLACE 1,3,NORTH')
            move = action.execute(robot, 'RIGHT')
            expect(robot.position).to eq({x: 1, y: 3, f: 'EAST'})
        end

        it 'performs REPORT' do 
            place = action.execute(robot, 'PLACE 1,3,EAST')
            output = action.execute(robot, 'REPORT')
            expect(output).to match('Output: 1,3,EAST')
        end
        
    end

end