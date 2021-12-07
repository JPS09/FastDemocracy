require 'time'

class Poll < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :voters, dependent: :destroy

  # validates :name, length: { minimum: 5 } # possible regex plus tard
  # validates :user_id, presence: true
  # # validates :status, presence: true, acceptance: { accept: ["pending", "active", "completed"] }
  # validates :expiry_date, presence: true
  # validates :deletion_date, presence: true

  def initial_expiry_date
    self.expiry_date = Time.new + 3.hours
    self.deletion_date = self.expiry_date + 5.minutes
    self.save!
  end

  def vote_expiry_date
    @expiry_date = Time.now + 10.minutes
    @deletion_date = @expiry_date + 24.hours
    save!
  end

  def set_status_to_questions_done
    @status = 'QUESTIONS_DONE'
    save!
  end

  def set_status_to_sent
    @status = 'SENT'
    save!
  end

  def set_status_to_ongoing
    @status = 'ONGOING'
    save!
  end

  def set_status_to_over
    @status = 'OVER'
    save!
  end
end
