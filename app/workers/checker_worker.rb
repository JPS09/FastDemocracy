class CheckerWorker
  include Sidekiq::Worker

  # this worker checks if the status is still pending (3h after creation) and deletes it if it is "pending".
  def perform(poll_id)
    poll = Poll.find(poll_id)
    if poll.status == "PENDING"
      poll.destroy
    end
  end

end
