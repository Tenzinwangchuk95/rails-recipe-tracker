class Recipe < ApplicationRecord
    has_many :ratings
    belongs_to :user
    has_many :recipes_tags
    has_many :tags, through: :recipes_tags

    validates :name, presence: true
    validates :ingredient_count, length: {minimum: 1}
    validates :ingredients, presence: true
    validates :difficulty, presence: true
    validates :instructions, presence: true

    scope :most_ingredients, -> {where(ingredient_count: self.maximum(:ingredient_count)) }
end
