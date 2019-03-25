class Experience < ApplicationRecord
    has_many :users, through: :destinations
    belongs_to :destination
    validates :activity, presence: true

end
