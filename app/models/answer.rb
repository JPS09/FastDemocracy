class Answer < ApplicationRecord
  belongs_to :question
  has_many :opinions, dependent: :destroy
  validates :content, length: { minimum: 2, maximum: 30, message: "Content must be 2 characters min. and 30 max." }

end
