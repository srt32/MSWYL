class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :event_id
      t.string :email
      t.string :name
      t.string :semester
      t.integer :num_guests

      t.timestamps
    end
  end
end
