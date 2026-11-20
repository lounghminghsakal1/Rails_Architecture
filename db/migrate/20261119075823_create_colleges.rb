class CreateColleges < ActiveRecord::Migration[8.1]
  def change
    create_table :colleges do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :principal

      t.timestamps
    end

    add_check_constraint :colleges, "char_length(name) >= 5", name: "college_name_check"
  end
end
