class Voter < ApplicationRecord
  has_secure_token :token, length: 18
  belongs_to :poll
  has_many :opinions, dependent: :destroy

end
