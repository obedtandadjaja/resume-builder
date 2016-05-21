Rails.application.routes.draw do
  devise_for :users
  root to: 'resumes#index'
  resources :experience_duties
  resources :experiences
  resources :education_accomplishments
  resources :educations
  resources :additional_infos
  resources :skills
  resources :links
  resources :resumes
  resources :users
end
