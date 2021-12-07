class DeletionWorker
  include Sidekiq::Worker

  # apparently, it must be passed a primitive object, not an ActiveRecord one
  # so I'll just give it the id and ask him to look for it then destroy it
  # I'm afraid tho that some dependences were improperly set. we'll see if it crashes :)
  def perform(target_poll)
    Poll.find(target_poll).destroy
  end

end
