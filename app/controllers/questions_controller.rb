class QuestionsController < ApplicationController
  before_action :find_poll, only: %i[new create]

  def new
    @question = Question.new
    @existingquestions = Question.where(poll_id: params[:poll_id])
  end

  def create
    @question = Question.new
    q = Question.new(question_params)
    q.question_type = "UNIQUE"
    q.poll_id = params[:poll_id]
    if q.save
      params[:answers].each do |a|
        Answer.new(question_id: q.id, content: a).save
      end
      redirect_to poll_path(@poll)
    else
      render "polls/show"
    end
  end

  def destroy
  end

  def show
    @question = Question.find(id: params[:poll_id])
    @questions = Question.where(poll_id: params[:id])
  end

  def update
  end

  def edit
  end

  private

  def find_poll
    @poll = Poll.find(params[:poll_id])
  end

  def question_params
    params.require(:question).permit(:poll_id, :title, :content, :answers, :mandatory, :question_type)
  end

end
