class VoterMailer < ApplicationMailer

  # Since the tokens are registered in the DB, I can just call the voters here and find their tokens.
  def call_for_votes
    @poll = Poll.find(params[:poll_id])
    if new_voter_email # This is a security measure, to make sure the status changes only if the emails were sent.
      @poll.status = "ongoing"
      raise
      flash[:success] = "Thank you for trusting our service!
      We are currently sending the links to vote to your audience.
       We'll redirect you to your poll view."
      redirect to poll_path(@poll)
      return true
    end
  end

  private

  def new_voter_email
    @poll = Poll.find(params[:poll_id])
    @voters = Voter.where(poll_id: @poll.id)
    # the below code sends an email to every voter for the poll.
    @voters.each do |voter|
      raise
      mail(to: voter.email, subject: 'Your opinion is expected.')
    end
    return true
  end

end
