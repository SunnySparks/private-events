class Event < ApplicationRecord
  has_many :event_invitations
  has_many :attendees, through: :event_invitations, foreign_key: :attendee_id, source: :user

  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
