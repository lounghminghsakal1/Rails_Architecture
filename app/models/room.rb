class Room < ApplicationRecord
  belongs_to :hostel
  has_many :student_profiles

  validates :room_number, presence: true, uniqueness: { scope: :hostel_id }
end
