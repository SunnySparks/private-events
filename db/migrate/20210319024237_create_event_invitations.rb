class CreateEventInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :event_invitations do |t|
      t.integer :creator_id
      t.integer :created_event_id

      t.timestamps
    end
  end
end
