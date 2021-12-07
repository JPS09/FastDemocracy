class Voter < ApplicationRecord
  has_secure_token :token
  belongs_to :poll
  has_many :opinions, dependent: :destroy

  def mark_as_has_voted
    self.has_voted = true
    save!
  end
end
