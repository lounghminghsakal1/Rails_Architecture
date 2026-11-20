class AddOneToOneInUserStudentHostelAdmin < ActiveRecord::Migration[8.1]
  def change
    remove_index :student_profiles, :user_id
    add_index :student_profiles, :user_id, unique: true

    remove_index :hostel_admin_profiles, :user_id
    add_index :hostel_admin_profiles, :user_id, unique: true
  end
end
