class MainController < ApplicationController
  def home
    @characters = Character.desc(:created_at).page(params[:page]).per(50)
  end

  def about
  end

  def contact
  end
end
