class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    validates :name, uniqueness: true
end
