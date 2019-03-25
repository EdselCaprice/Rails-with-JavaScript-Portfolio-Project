class User < ApplicationRecord
    has_secure_password
    has_many :experiences, through: :destinations
    has_many :destinations

    def current_wanderpoints
      wanderpoints =  (self.destinations.count * 50) + count_experiences
    end


    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
        user.password = SecureRandom.hex
        user.username = auth_hash["info"]["uid"]
        user.email = auth_hash["info"]["auth_hash"]
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
