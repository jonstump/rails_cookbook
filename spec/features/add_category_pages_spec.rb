require 'rails_helper'

describe "the add category process" do
  it "adds a new category" do
    visit categories_path
    click_link 'Create new category'
    fill_in 'Category name', :with => 'Spaghetti'
    click_on 'Create Category'
    expect(page).to have_content 'Category successfully added!'
    expect(page).to have_content 'Spaghetti'
  end

  # it "gives an error when no name is entered" do
  #   visit new_recipe_path
  #   click_on 'Create Recipe'
  #   expect(page).to have_content "Name can't be blank"
  # end
end
