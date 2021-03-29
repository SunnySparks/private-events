class User < ApplicationRecord
  has_many :event_invitations
  has_many :events

  # has_many :attended_events, through: :event_invitation, source: :event
end
