class User < ApplicationRecord
    has_many :recipes
    has_many :ratings, through: :recipes

    validates :user_name, presence: true, uniqueness: true
    

    def self.current_user(session)
        self.find_by_id(session[:user_id])
    end
    
    def self.is_logged_in?(session)
        !!session[:user_id]
    end
end
