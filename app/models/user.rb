class User < ApplicationRecord
    has_many :created_events, foreign_key: :created_event_id, class_name: "Event"
end
