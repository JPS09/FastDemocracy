# test purposes only
# does work tho !

class FakeWorker
  include Sidekiq::Worker

  def perform
    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
    "@api.eu.mailgun.net/v3/fastdemocracy.me/messages",
    from: "FastDemocracy <mailgun@fastdemocracy.me>",
    to: "julienkarmann@gmail.com",
    subject: "Test fake_worker actually works",
    text: "Test fake_worker actually works"
  end
end
