class User < ApplicationRecord
    has_secure_password
    has_many :experiences
    has_many :destinations, through: :experiences

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

    def self.other_destinations(current_user)
        User.all.collect do |user|
            if user != current_user
                "#{user.username} traveled to #{user.destinations.collect { |destination| destination.location}.to_sentence}"
            end
        end
    end

end
