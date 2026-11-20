class College < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :address, presence: true

  has_many :hostels
  has_many :student_profiles
  has_many :hostel_admin_profiles
  has_many :users
end
