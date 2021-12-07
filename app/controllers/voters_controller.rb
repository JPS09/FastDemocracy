require 'rest-client'

class VotersController < ApplicationController

  def create
    @poll = Poll.find(params[:poll_id])
    emails_list = params[:voters]
    emails_list.each do |email|
      unless email.empty?
        voter = Voter.new(poll_id: @poll.id, email: email)
        voter.regenerate_token
        voter.save!
        call_for_votes(voter)
      end
    end
    @poll.status = "sent"
    @poll.save!
    redirect_to poll_path(@poll)
    # AFAIK, the raise showed that the voters were perfectly created with the correct poll_id and the correct email. Yay !
  end


  def call_for_votes(voter)
    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
    "@api.eu.mailgun.net/v3/fastdemocracy.me/messages",
    from: "FastDemocracy <mailgun@fastdemocracy.me>",
    to: "#{voter.email}",
    subject: "You've been called for a vote",
    text: "Hi there ! Your input is requested. Please click this link and vote :
    http://fastdemocracy.herokuapp.com/#{@poll.id}/vote/#{voter.token} ."
  end


  # TODO : write a test to get the API response and if positive, go to the next step
  # and change the poll status accordingly.

end
