class Voter < ApplicationRecord
  has_secure_token :token
  belongs_to :poll
  has_many :opinions, dependent: :destroy
end
