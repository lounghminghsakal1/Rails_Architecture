class AddRoomRelationInStudentProfile < ActiveRecord::Migration[8.1]
  def change
    add_reference :student_profiles, :room, null: true, foreign_key: true
  end
end
