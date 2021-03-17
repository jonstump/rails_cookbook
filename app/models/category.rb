class Category < ApplicationRecord
  has_and_belongs_to_many (:recipes)
  validates :category_name, presence: true
end
