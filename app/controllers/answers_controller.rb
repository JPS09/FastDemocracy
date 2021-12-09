class AnswersController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_answer, only: [:show, :update]
  before_action :new_answer, only: [:new, :create]
  def new
  end

  def show
  end

  def update
    @answer.update(answer_params)
  end

  def create
    if @answer.save
      redirect_to answer_path(@answer)
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :content)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def new_answer
    @answer = Answer.new
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
