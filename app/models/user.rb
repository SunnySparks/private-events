class User < ApplicationRecord
    has_many :created_events, foreign_key: :created_event_id, class_name: "Event"

    has_many :attended_events, through: :event_invitations, source: :event_invitation_id
end
