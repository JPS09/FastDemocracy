class Question < ApplicationRecord
  belongs_to :poll
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :title, length: { minimum: 5, maximum: 40 }
  validates :content, length: { minimum: 10, maximum: 200 }
  # validates :mandatory, default: true
  validates :question_type, presence: true, acceptance: { accept: ["unique", "multiple"] }
end
