require 'rails_helper'

describe "the edit category process" do
  it "edit a category" do
    category = Category.new({:category_name => 'bread'})
    category.save()
    visit categories_path
    click_link 'bread'
    click_link 'Edit'
    fill_in 'Category name', :with => 'pasta'
    click_on 'Update Category'
    expect(page).to have_content 'Category successfully updated!'
    expect(page).to have_content 'pasta'
  end

  # it "gives an error when no category name is entered" do
  #   visit new_category_path
  #   click_on 'Create Category'
  #   expect(page).to have_content "Category name can't be blank"
  # end
end