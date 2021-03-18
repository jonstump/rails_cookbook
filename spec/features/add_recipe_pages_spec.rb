require 'rails_helper'

describe "the add recipe process" do
  it "adds a new recipe" do
    category = Category.new({:category_name => 'bread'})
    category.save
    ingredient = Ingredient.new({:ingredient_name => 'Barley'})
    ingredient.save
    visit recipes_path
    click_link 'Create new recipe'
    fill_in 'Name', :with => 'Spaghetti'
    fill_in 'Instructions', :with => 'Boil noodles'
    select 'bread', from: 'category_selection'
    select 'Barley', from: 'ingredient_selection'
    click_on 'Create Recipe'
    expect(page).to have_content 'Recipe successfully added!'
    expect(page).to have_content 'Spaghetti'
  end

  # it "gives an error when no name is entered" do
  #   visit new_album_path
  #   click_on 'Create Album'
  #   expect(page).to have_content "Name can't be blank"
  # end
end



