module ApplicationHelper
  def invalid_voter
    redirect_to root_path
  end

  def voter_allowed_on_vote?
    return true if @voter.poll_id == @poll.id
  end

  def check_if_poll_complete
    total_voters = @poll.voters.count
    voters_who_voted = Voter.where(poll_id: @poll.id, has_voted: true)
    if total_voters == voters_who_voted
      @poll.
    end


end
