require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:brownie) { Dessert.new("brownie", 24, chef)}
  let(:chef) { double("chef", name: "Rico") }

  describe "#initialize" do
    it "sets a type" do 
      expect(brownie.type).to eq("brownie")
    end 
    it "sets a quantity" do 
      expect(brownie.quantity).to eq(24)
    end
    it "starts ingredients as an empty array" do 
      expect(brownie.ingredients).to eq([])
    end 
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "alot", "Jimmy")}.to raise_error(ArgumentError)
    end 
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      expect(brownie.ingredients).to_not include("flour")
      brownie.add_ingredient("flour")
      expect(brownie.ingredients).to eq(["flour"])
    end 
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ["flour", "love", "eggs", "butter"].each{|ingredient|brownie.add_ingredient(ingredient)}
      brownie.mix!
      expect(brownie.ingredients).not_to eq(["flour", "love", "eggs", "butter"])
      expect(brownie.ingredients).to match_array(["flour", "love", "eggs", "butter"])
    end 
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      brownie.eat(5)
      expect(brownie.quantity).to eq(19)
    end 

    it "raises an error if the amount is greater than the quantity" do 
      expect{brownie.eat(30)}.to raise_error("not enough left!")
    end 
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return("Chef Rico the Great Baker")
      expect(brownie.serve).to eq("Chef Rico the Great Baker has made 24 brownies!")
    end 
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
