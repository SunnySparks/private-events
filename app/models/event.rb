class Event < ApplicationRecord
    has_many :event_invitations
    has_many :events, through: :event_invitations
    belongs_to :creator, :foreign_key => "creator_id", :class_name => "User"

    
    has_many :attendees, through: :event_invitations, source: :user

    scope :past, -> { where('date < ?', Date.today) }
    scope :upcoming, -> { where('start >= ?', Date.today) }
end
