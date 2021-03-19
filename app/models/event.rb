class Event < ApplicationRecord
    belongs_to :creator, foreign_key: :creator_id, class_name: "User"
    
    has_many :attendees, through: :created_events, source: :event_invitation
end
