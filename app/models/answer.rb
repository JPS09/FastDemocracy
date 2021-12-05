class Answer < ApplicationRecord
  belongs_to :question


  validates :content, length: { minimum: 2, maximum: 30 }

end
