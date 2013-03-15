class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :street
      t.string :city
      t.string :state
      t.integer :zip
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
