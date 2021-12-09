class OpinionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_poll, only: %i[new create]

  def new
    @questions = @poll.questions
    @token = params[:token]
    @voter = Voter.find_by token: @token
    @opinion = Opinion.new
  end

  def create
    @voter = Voter.find(params[:voter_id])
    @token = params[:token]
    @opinions = opinion_params.to_hash
    @opinions.each do |opinion|
      Opinion.new(poll_id: params[:poll_id], question_id: opinion[0], answer_id: opinion[1], voter_id: @voter.id).save!
    end
    @voter.mark_as_has_voted
    # this function changes the poll status if all voters expressed their vote
    helpers.check_if_poll_complete(@poll)
    redirect_to opinion_path(@poll)
  end

  def invalid_voter
    redirect_to root_path
  end
  helper_method :invalid_voter

  private

  def opinion_params
    params.require(:answers).permit!
  end

  def find_poll
    @poll = Poll.find(params[:poll_id])
  end

end
