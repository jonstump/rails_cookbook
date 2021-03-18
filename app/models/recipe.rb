class Recipe < ApplicationRecord
  has_and_belongs_to_many (:categories)
  has_and_belongs_to_many (:ingredients)
  validates :name, presence: true, uniqueness: true

  before_save(:titleize_recipe, presence: name, uniqueness: true)

  private
    def titleize_recipe
      self.name = self.name.titleize
    end
end
