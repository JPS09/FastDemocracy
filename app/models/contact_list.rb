class ContactList < ApplicationRecord
  belongs_to :contact
  belongs_to :user
  has_many :contact, dependent: :destroy
  has_many :user_id, dependent: :destroy

  validates :name, presence: true

end
