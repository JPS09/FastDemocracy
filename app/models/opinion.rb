class Opinion < ApplicationRecord
  belongs_to :question
  belongs_to :answer
  belongs_to :voter
  belongs_to :poll
end
