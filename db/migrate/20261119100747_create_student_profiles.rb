class CreateStudentProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :student_profiles do |t|
      t.string :roll_number, null: false
      t.string :department, null: false
      t.references :hostel, null: false, foreign_key: true
      t.references :college, null: false, foreign_key: true
      t.decimal :cgpa
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :student_profiles, :roll_number, unique: true
    add_check_constraint :student_profiles, "cgpa BETWEEN 0 AND 10", name: "cgpa_check"
  end
end
