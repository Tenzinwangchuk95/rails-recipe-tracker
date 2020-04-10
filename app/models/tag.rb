class Tag < ApplicationRecord
    has_many :recipes_tags
    has_many :recipes, through: :recipes_tags

    validates :name, uniqueness: true
end
