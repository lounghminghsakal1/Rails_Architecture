class CreateRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :rooms do |t|
      t.string :room_number, null: false
      t.references :hostel, null: false, foreign_key: true, index: false

      t.timestamps
    end

    add_index :rooms, [ :room_number, :hostel_id ], unique: true
  end
end
