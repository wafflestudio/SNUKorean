class QuizzesController < ApplicationController
  def my
  end

  def create
    if user_signed_in?
      @quiz = Quiz.generate_questions(30, current_user)
    else
      @quiz = Quiz.generate_questions(30)
    end
    redirect_to quiz_path(@quiz)
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
