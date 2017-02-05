require "spec_helper"
require "./tic_tac_toe"

describe "Game" do
	before (:example) do
		@g = Game.new
	end

	describe "#game_won?" do
		it "returns true if won, false otherwise" do

			@g.a = ["X", "X", "X", 4,5,6,7,8,9]
			expect(@g.game_won?).to eq(true)

			@g.a = ["X", "X", 3,4,5,6,7,8,9]
			expect(@g.game_won?).to eq(false)

			@g.player_symbol = "O"
			@g.a = [1,2,3,"O","O","O",7,8,9]
			expect(@g.game_won?).to eq(true)
		end
	end

	describe "#switch" do
		it "switches symbols" do
			@g.player_symbol = "O"
			@g.switch
			expect(@g.player_symbol).to eq("X")
		end
	end

end