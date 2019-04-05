class User < ApplicationRecord
    has_secure_password
    has_many :experiences, through: :destinations
    has_many :destinations

    validates :email, presence: true
    validates :username, presence: true
    validates :password, presence: true
    validates :email, uniqueness: true
    validates :username,uniqueness: true

    def current_wanderpoints
      wanderpoints =  (self.destinations.count * 50)
    end


    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
        user.password = SecureRandom.hex
        user.username = auth_hash["info"]["uid"]
        user.email = auth_hash["info"]["email"]
        end
    end

end
