class User < ApplicationRecord
    has_secure_password
    has_many :experiences, through: :destinations
    has_many :destinations

    def current_wanderpoints
      wanderpoints =  (self.destinations.count * 50) + count_experiences
    end

    def self.find_or_create_by_omniauth[auth_hash]
        oauth_email = auth_hash["info"]["email"]
        if user = User.find_by(:email => oauth_email)
            return user
        else
            user = User.create(:email => oauth_email, :password => SecureRandom.hex)
        end
    end

        
    private


    def count_experiences
        counter = 0
        Destination.all.each do |destination|
            destination.experiences.each do |experience|
                if experience.destination_id == destination.id
                    counter = counter + 1
                end
            end
        end
        return counter * 10
    end

end
