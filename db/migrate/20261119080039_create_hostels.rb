class CreateHostels < ActiveRecord::Migration[8.1]
  def change
    create_table :hostels do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.references :college, null: false, foreign_key: true
      t.string :director

      t.timestamps
    end

    add_check_constraint :hostels, "char_length(name) >= 5", name: "hostel_name_check"
  end
end
