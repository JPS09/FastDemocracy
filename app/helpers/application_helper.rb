module ApplicationHelper
  def invalid_voter
    redirect_to root_path
  end

  def voter_allowed_on_vote?
    return true if @voter.poll_id == @poll.id
  end

end
