class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_name

      t.timestamps
    end

    create_table :categories_recipes, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :recipe, index: true
    end
  end
end
