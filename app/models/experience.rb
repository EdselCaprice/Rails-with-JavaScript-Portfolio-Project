class Experience < ApplicationRecord
    belongs_to :destination
    belongs_to :user
    scope :activities, -> { order(:activity) }
    validates :activity, presence: true


    def self.other_experiences(current_user, set_location)
        Experience.all.collect do |experience|
            if experience.user != current_user && experience.destination.location == set_location
                 "#{experience.user.username} traveled to #{experience.destination.location} and went #{experience.activity}"
            end
        end.compact
    end

end