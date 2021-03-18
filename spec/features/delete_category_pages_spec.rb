require 'rails_helper'

describe "the delete category process" do
  it "delete a catefory" do
    category = Category.new({:category_name => 'bread'})
    category.save
    visit categories_path
    click_link 'bread'
    click_link 'Delete'
    expect(page).to have_content 'Category has been successfully deleted'
    expect(page).to have_no_content 'bread'
  end  
end