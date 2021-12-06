class OpinionsController < ApplicationController
  before_action :validate_voter, only: :new

  def new
    @poll = params[:poll_id]
    @opinion = Opinion.new
    @questions = @poll.questions
  end

  def create

  end

  private

  def validate_voter
    @poll = params[:poll_id]
    @voter = Voter.find_by poll_id: params[:poll_id], token: params[:token]
  end
end
