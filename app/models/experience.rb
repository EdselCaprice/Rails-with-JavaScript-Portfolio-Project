class Experience < ApplicationRecord
    belongs_to :destination
    belongs_to :user
    scope :activities, -> { order(:activity) }

    validates :activity, presence: true

end
