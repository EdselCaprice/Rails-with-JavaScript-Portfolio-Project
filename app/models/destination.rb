class Destination < ApplicationRecord
    belongs_to :user
    has_many :experiences
    scope :locations, -> { order(:location) }
    validates :location, presence: true

end
