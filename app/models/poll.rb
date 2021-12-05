class Poll < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :voters, dependent: :destroy

  # validates :name, length: { minimum: 5 } # possible regex plus tard
  # validates :user_id, presence: true
  # # validates :status, presence: true, acceptance: { accept: ["pending", "active", "completed"] }
  # validates :expiry_date, presence: true
  # validates :deletion_date, presence: true

end
