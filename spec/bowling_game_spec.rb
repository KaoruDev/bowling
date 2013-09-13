require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../bowling_game'

describe BowlingGame do
  let(:game){
    BowlingGame.new
  }

  describe '.initialize' do # what you expect class/ module to do
    it 'sets @rolls to an empty array' do 
      expect(game.rolls).to eq([])
   end
  end

  describe '#score' do 
    context 'when only gutter balls are thrown' do
      it 'scores the game as 0 when only gutter balls are thrown' do
        20.times { game.roll(0) }

        expect(game.score).to eq(0)
      end
    end

    context 'when one pin is knocked down on each roll' do
      it 'scores the game as 20 when one pin is knocked down on each roll' do
        20.times { game.roll(1) }

        expect(game.score).to eq(20)
      end
    end

    context 'when a spare is thrown' do
      it 'records the frame score as 10 plus the number of pins knocked down in the next roll' do
        3.times { game.roll(5) }
        17.times { game.roll(0) }

        expect(game.score).to eq(20)
      end
    end

    context "when a strike is thrown" do
      it "records the frame score as 10 plus the total number of pins knocked down in the next two rolls" do
        game.roll(10)
        game.roll(7)
        game.roll(1)
        16.times { game.roll(0) }

        expect(game.score).to eq(26)
      end
    end

    context 'when last 3 frames are strikes' do
      it 'total score is 30 and does not record any extra pins' do
        18.times { game.roll(0) }
        game.roll(10)
        game.roll(10)
        game.roll(10)
        game.roll(10)
      
        expect(game.score).to eq(30)
        #expect(game.frame).to eq(10)
      end
    end
  end 
end # end of Bowling game
