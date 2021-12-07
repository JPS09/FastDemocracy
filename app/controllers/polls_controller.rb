class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new(id: poll_params[:format])
    # sends CheckerWorker to verify if status didn't change and delete it.
    redirect_to poll_path(@poll)
  end

  def show
    @poll = Poll.find(params[:id])
    @question = Question.new
    @existingquestions = Question.where(poll_id: params[:id])
  end

  def questions_done
    @poll = Poll.find(params[:poll_id])
    @poll.set_status_to_questions_done
    redirect_to poll_path(@poll)
  end

  def create
    @poll = Poll.create(user: current_user, status: "PENDING")
    @poll.initial_expiry_date
    CheckerWorker.perform_in(3.hours, @poll.id)
    # by default, a user can create a poll and manage it during 3 hours.
    # Past this deadline, it is to be destroyed 5 minutes later.
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
