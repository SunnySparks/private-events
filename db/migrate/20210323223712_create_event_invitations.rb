class CreateEventInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :event_invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
