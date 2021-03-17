require 'rails_helper'

describe Recipe do
  it {should have_and_belong_to_many(:ingredients)}
  it {should have_and_belong_to_many(:categories)}
  it {should validate_presence_of :name}

  it("titleizes the name of a recipe") do
    recipe = Recipe.create({name: "cookies", instructions: "make from tube of dough"})
    expect(recipe.name()).to(eq("Cookies"))
  end
end