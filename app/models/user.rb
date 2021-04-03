class User < ApplicationRecord

  has_many :event_invitations
  has_many :events, foreign_key: :creator_id, class_name: 'Event', dependent: :destroy

  has_many :attended_events, through: :event_invitations, source: :event, dependent: :destroy
end
