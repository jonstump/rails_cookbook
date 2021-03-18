# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Recipe.destroy_all
Category.destroy_all
Ingredient.destroy_all

10.times do
  @recipe = Recipe.create!(name: Faker::Food.unique.dish,    
    instructions: Faker::Lorem.sentence(word_count: 20).chop)
  1.times do
    @ingredient1 = Ingredient.create!(ingredient_name: Faker::Food.unique.ingredient)
    @category1 = Category.create!(category_name: Faker::Food.fruits)
    @recipe.ingredients << @ingredient1
    @recipe.categories << @category1
  end
end


p "Created #{Recipe.count} recipes, #{Ingredient.count} ingredients, and #{Category.count} categories."