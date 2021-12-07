class OpinionsController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @questions = @poll.questions
    @token = params[:token]
    @voter = Voter.find_by token: @token
    @opinion = Opinion.new
  end

  def create
    @voter = Voter.find(params[:voter_id])
    @opinions = opinion_params.to_hash
    @opinions.each do |opinion|
      Opinion.new(question_id: opinion[0], answer_id: opinion[1], voter_id: @voter.id).save!
    end
    @voter.mark_as_has_voted
  end

  def invalid_voter
    redirect_to root_path
  end
  helper_method :invalid_voter

  private

  def opinion_params
    params.require(:answers).permit!
  end

end
