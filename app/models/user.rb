class User < ApplicationRecord
  belongs_to :college
  belongs_to :hostel

  has_one :student_profile
  has_one :hostel_admin_profile

  validates :name, presence: true, length: { minimum: 3 }
  enum :status, {
    "active": 0,
    "inactive": 1
  }

  enum :role, {
    hostel_admin: 0,
    student: 1
  }
end
