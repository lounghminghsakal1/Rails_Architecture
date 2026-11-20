class CreateHostelAdminProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :hostel_admin_profiles do |t|
      t.integer :admin_level, null: false
      t.references :user, null: false, foreign_key: true
      t.references :hostel, null: false, foreign_key: true
      t.references :college, null: false, foreign_key: true

      t.timestamps
    end

    add_check_constraint :hostel_admin_profiles, "admin_level > 0 AND admin_level < 6", name: "hostel_admin_level_check"
  end
end
