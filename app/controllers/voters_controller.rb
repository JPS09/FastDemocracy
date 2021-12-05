require 'rest-client'

class VotersController < ApplicationController

  def create
    @poll = Poll.find(params[:poll_id])
    emails_list = params[:voters]
    emails_list.each do |email|
      Voter.new(poll_id: @poll.id, email: email).save!
      call_for_votes(email)
    end
    redirect_to poll_path(@poll)
    # AFAIK, the raise showed that the voters were perfectly created with the correct poll_id and the correct email. Yay !
  end

  def call_for_votes(email)
    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
    "@api.eu.mailgun.net/v3/fastdemocracy.me/messages",
    :from => "FastDemocracy <mailgun@fastdemocracy.me>",
    :to => "#{email}",
    :subject => "You've been called for a vote",
    :text => "Hello, this is a test ?"
  end

  # TODO : write a test to get the API response and if positive, go to the next step
  # and change the poll status accordingly.
end
