class Account < ApplicationRecord
  has_one_attached :avatar
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :mobile_number, presence: true, length: { maximum: 15 },
            uniqueness: true
end
