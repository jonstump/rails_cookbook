require 'rails_helper'

describe "the delete recipe process" do
  it "delete a recipe" do
    recipe = Recipe.new({:name => 'Spaghetti'})
    recipe.save
    category = Category.new({:category_name => 'bread'})
    category.save
    ingredient = Ingredient.new({:ingredient_name => 'Barley'})
    ingredient.save
    visit recipes_path
    click_link 'Spaghetti'
    click_link 'Delete'
    expect(page).to have_content 'Recipe has been successfully deleted'
    expect(page).to have_no_content 'Spaghetti'
  end  
end