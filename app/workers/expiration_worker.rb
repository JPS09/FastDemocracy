class ExpirationWorker
  include Sidekiq::Worker

  # this worker is called when the expiry date is reached OR when the vote is complete.
  # it starts another worker for 24 hours later, calling for the deletion of the said poll (and hopefully all of its questions, answers, voters and opinions.)
  def perform(target_poll)
    poll = Poll.find(target_poll)
    poll.status = "OVER"
    poll.save!
    DeletionWorker.perform_in(24.hours, poll.id)
  end

end
