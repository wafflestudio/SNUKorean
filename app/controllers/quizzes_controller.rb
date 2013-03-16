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
    unless @quiz.solved
      redirect_to edit_quiz_path(@quiz)
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
    if @quiz.solved
      redirect_to quiz_path(@quiz)
    end
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(params[:quiz])
      redirect_to edit_quiz_path(@quiz)
    else
      render "edit"
    end
  end

  def destroy
  end
end
