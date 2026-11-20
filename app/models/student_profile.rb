class StudentProfile < ApplicationRecord
  belongs_to :hostel
  belongs_to :college
  belongs_to :user
  belongs_to :room, optional: true

  validates :roll_number, presence: true, uniqueness: true
  validates :department, presence: true
  validates :cgpa, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :user_id, uniqueness: true
end
