class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password_hash
      t.integer :role
      t.references :college, null: false, foreign_key: true
      t.references :hostel, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end

    add_check_constraint :users, "char_length(name) >=3", name: "user_name_check"
    add_index :users, [ :hostel_id, :college_id ]
  end
end
