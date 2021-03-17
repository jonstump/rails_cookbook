require 'rails_helper'

describe Recipe do
  it {should have_and_belong_to_many(:ingredients)}
  it {should have_and_belong_to_many(:categories)}
  it {should validate_presence_of :name}
end