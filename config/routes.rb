SnuKorean::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  ## ACOUNT
  match "/me" => "users#profile", :as => "my_profile"
  match "/me/score" => "quizzes#my", :as => "my_score"
  match "/me/group" => "groups#my", :as => "my_group"

  ## QUIZ
  resources :quizzes, :only => [:create, :show, :edit, :update, :destroy]

  root :to => "main#home"
  match "/about" => "main#about"
  match "/contact" => "main#contact"
end
