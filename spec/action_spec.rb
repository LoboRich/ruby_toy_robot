require 'rspec'
require_relative 'robot'
require_relative 'action'

describe 'Toy Robot' do
    describe 'action' do
        it 'performs PLACE' do 
            r = Robot.new
            a = Action.new
            place = a.execute(r, 'PLACE 1,2,NORTH')
            expect(r.position).to eq({x: 1, y: 2, f: 'NORTH'})
        end
    end

    # describe 'set position' do
    #     it 'sets position' do 
    #         r = Robot.new
    #         r.x = 1
    #         r.y = 2
    #         r.f = 'NORTH'
    #         expect(r.position).to eq({x: 1, y: 2, f: 'NORTH'})
    #     end
    # end
end