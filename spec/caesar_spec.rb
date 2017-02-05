require "spec_helper"
require "./caesar"

describe "#caesar_cipher" do
	context "given a string" do
		it "returns 'Bmfy f xywnsl!'" do
			expect(caesar_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
		end
		it "returns 'Jung n fgevat!'" do
			expect(caesar_cipher("What a string!", 13)).to eq("Jung n fgevat!")
		end
		it "returns nil if shift is negative" do
			expect(caesar_cipher("What a string!", -1)).to eq(nil)
		end
		it "returns 'What a string!'" do
			expect(caesar_cipher("What a string!", 0)).to eq("What a string!")
		end
	end

	context "given an empty string" do
		it "returns empty string" do
			expect(caesar_cipher("", 5)).to eq("")
		end
	end

	context "given a string with non-letter characters" do
		it "returns ciphered letters while leaving alone other characters" do
			expect(caesar_cipher("What a string!8-+()*@", 5)).to eq("Bmfy f xywnsl!8-+()*@")
		end
	end
end
