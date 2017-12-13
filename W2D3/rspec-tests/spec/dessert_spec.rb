require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements
 without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:ice_cream) { Dessert.new("ice cream", 10, chef) }
  let(:chef) { double("chef", name: "Jon") }

  describe "#initialize" do
    it "sets a type" do
      expect(ice_cream.type).to eq("ice cream")
    end

    it "sets a quantity" do
      expect(ice_cream.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(ice_cream.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("popsicle", "what", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      ice_cream.add_ingredient("milk")
      expect(ice_cream.ingredients).to include("milk")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["milk", "chocolate", "sugar", "vanilla", "potassium benzonate"]
      ice_cream.ingredients.concat(ingredients)

      ice_cream.mix!
      expect(ice_cream.ingredients).not_to eq(ingredients)
      expect(ice_cream.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      ice_cream.eat(4)
      expect(ice_cream.quantity).to eq(6)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ ice_cream.eat(9001) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jon the Great Baker")
      expect(ice_cream.serve).to eq("Chef Jon the Great Baker has made 10 ice creams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(ice_cream)
      ice_cream.make_more
    end
  end
end
