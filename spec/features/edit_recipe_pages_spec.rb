require 'rails_helper'

describe "the edit recipe process" do
  it "edit a recipe" do
    recipe = Recipe.new({:name => 'Spaghetti'})
    recipe.save
    category = Category.new({:category_name => 'bread'})
    category.save
    ingredient = Ingredient.new({:ingredient_name => 'Barley'})
    ingredient.save
    visit recipes_path
    click_link 'Spaghetti'
    click_link 'Edit'
    fill_in 'Name', :with => 'Lasagna'
    fill_in 'Instructions', :with => 'Boil noodles'
    select 'bread', from: 'category_selection'
    select 'Barley', from: 'ingredient_selection'
    click_on 'Update Recipe'
    expect(page).to have_content 'Recipe has been successfully updated'
    expect(page).to have_content 'Lasagna'
  end

  # it "gives an error when no name is entered" do
  #   visit new_recipe_path
  #   click_on 'Create Recipe'
  #   expect(page).to have_content "Name can't be blank"
  # end
end
