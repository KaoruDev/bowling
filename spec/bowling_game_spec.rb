require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../bowling_game'

describe Bowling do
  describe '.initialize' do # what you expect class/ module to do
    it 'sets @rolls to an empty array' do 
      game = Bowling.new

      expect(game.rolls).to eq([])
   end
  end
end
