class Recipe < ApplicationRecord
    has_many :ratings
    belongs_to :user
    has_many :recipes_tags
    has_many :tags, through: :recipes_tags
end
