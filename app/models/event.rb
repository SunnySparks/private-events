class Event < ApplicationRecord
  has_many :event_invitations, dependent: :destroy
  has_many :attendees, through: :event_invitations, source: :user, dependent: :destroy

  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('start >= ?', Date.today) }
end
