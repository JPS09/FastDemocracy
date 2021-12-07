class ContactList < ApplicationRecord
  belongs_to :contact
  belongs_to :user
  has_many :contacts, dependent: :destroy

  validates :name, presence: true


end
