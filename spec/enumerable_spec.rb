require "spec_helper"
require "./enumerable"

describe "Enumerable" do

	describe '#my_each' do
		it "does to each" do
			array = [1,2,3,4,5,6,7,8,9,10]
			expect(array.my_each).to eq([1,2,3,4,5,6,7,8,9,10])
		end
	end

	describe "#my_select" do
		it "selects from array" do
			array = [1,2,3,4,5,6,7,8,9,10]
			expect(array.my_select{ |num|  num.even?  }).to eq([2,4,6,8,10])
		end
	end

	describe "#my_all?" do
		it "returns true if all comply and false otherwise" do
			expect(['ant', 'bear', 'cat'].my_all? { |word| word.length >= 3 }).to eq(true)
			expect(['ant', 'bear', 'cat'].my_all? { |word| word.length >= 4 }).to eq(false)
		end
	end

	describe "#my_any?" do
		it "returns true if any comply and false otherwise" do
			expect(['ant', 'bear', 'cat'].my_any? { |word| word.length >= 5 }).to eq(false)
			expect(['ant', 'bear', 'cat'].my_any? { |word| word.length >= 4 }).to eq(true)
		end
	end

	describe "#my_none?" do
		it "returns true if none comply and false otherwise" do
			expect(['ant', 'bear', 'cat'].my_none? { |word| word.length == 5 }).to eq(true)
			expect(['ant', 'bear', 'cat'].my_none? { |word| word.length >= 4 }).to eq(false)
		end
	end

	describe "#my_count" do
		ary = [1, 2, 4, 2]
		it "returns number of items" do
			expect(ary.my_count).to eq(4)
		end
		it "returns number of items that are true given a block" do
			expect(ary.my_count{ |x| x%2==0 }).to eq(3)
		end
	end

	describe "#my_map" do
		it "returns new array by mapping" do
			array = [1,2,3,4]
			expect(array.my_map{ |i| i*i}).to eq([1,4,9,16])
			expect(array.my_map { "cat"  }).to eq(["cat", "cat", "cat", "cat"])
		end
	end


end