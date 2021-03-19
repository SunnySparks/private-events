class User < ApplicationRecord
    has_many :created_events, foreign_key: :created_event_id, class_name: "Event"

    has_many :attended_events, through: :created_events, source: :created_event_id
end
