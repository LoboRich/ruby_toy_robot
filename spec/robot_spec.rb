require 'rspec'
require_relative 'robot'

describe 'Toy Robot' do
    describe 'new' do
        it 'create an instance of robot' do 
            r = Robot.new
            expect(r).to be_a Robot
        end
    end

    describe 'set position' do
        it 'sets position' do 
            r = Robot.new
            r.x = 1
            r.y = 2
            r.f = 'NORTH'
            expect(r.position).to eq({x: 1, y: 2, f: 'NORTH'})
        end
    end
end