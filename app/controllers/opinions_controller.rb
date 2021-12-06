class OpinionsController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @questions = @poll.questions
    @token = params[:token]
    @voter = Voter.find_by token: @token
  end

  def create
    if allow_vote
      @opinions = params[:opinions]
      @opinions.each do |question, answer|
        Opinion.create(question_id: question.id, answer_id: answer.id, voter_id: @voter.id)
      end
      @voter.has_voted == true
    end
  end

  def invalid_voter
    redirect_to root_path
  end
  helper_method :invalid_voter

  private

  def allow_vote
    return true if Poll.find(Voter.find(@token)) && @poll.status == "open_for_vote" && @voter.has_voted == false
  end
end
