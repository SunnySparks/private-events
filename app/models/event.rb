class Event < ApplicationRecord
    belongs_to :creator, foreign_key: :creator_id, class_name: "User"
    
    has_many :attendees, through: :created_events, source: :event_invitation

    scope :past, -> { where('date < ?', Date.today) }
    scope :upcoming, -> { where('start >= ?', Date.today) }
end
