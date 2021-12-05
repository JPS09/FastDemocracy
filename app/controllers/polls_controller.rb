class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new(id: poll_params[:format])
    redirect_to poll_path(@poll)
  end

  def show
    @poll = Poll.find(params[:id])
    @question = Question.new
    @existingquestions = Question.where(poll_id: params[:id])
  end

  def questions_done
    @poll = Poll.find(params[:poll_id])
    @poll.status = "questions_done"
    if @poll.save!
      redirect_to poll_path(@poll)
    else
      raise
    end
  end

  def create
    @poll = Poll.create(user: current_user, status: "pending")
    redirect_to new_poll_path(@poll)
  end

  def update
    @poll = Poll
  end

  private

  def poll_params
    params.permit(:format, :name, :user_id, :expiry_date, :deletion_date)
  end
end
