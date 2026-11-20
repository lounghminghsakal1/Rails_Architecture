class HostelAdminProfile < ApplicationRecord
  belongs_to :user
  belongs_to :hostel
  belongs_to :college

  validates :admin_level, presence: true, numericality: { greater_than: 0, less_than: 6 }
  validates :user_id, unique: true
end
