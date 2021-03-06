class Destination < ApplicationRecord
    has_many :experiences
    has_many :users, through: :experiences
    scope :locations, -> { order(:location) }
    validates :location, presence: true
    accepts_nested_attributes_for :experiences

end
