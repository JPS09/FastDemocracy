class FakeJob < ApplicationJob

  # was used for test purposes
  queue_as :default

  def perform(*args)
    # Do something later
  end
end
