class Question < ApplicationRecord
  belongs_to :poll
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :title, length: { minimum: 2, maximum: 30 }
  # validates :content, length: { minimum: 8, maximum: 200 }
  # validates :mandatory, default: true
  validates :question_type, presence: true, acceptance: { accept: ["UNIQUE", "MULTIPLE"] }

  def set_question_type_to_unique
    @question_type = "UNIQUE"
  end
end
