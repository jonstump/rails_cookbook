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
    click_link 'Delete'
    expect(page).to have_content 'Recipe has been successfully deleted'
    expect(page).to have_no_content 'Spaghetti'
  end

  # it "gives an error when no name is entered" do
  #   recipe = Recipe.new({:name => 'Spaghetti'})
  #   recipe.save
  #   visit recipes_path
  #   click_link 'Spaghetti'
  #   click_link 'Edit'
  #   fill_in 'Name', :with => ' '
  #   click_on 'Update Recipe'
  #   expect(page).to have_content "Name can't be blank"
  # end
end