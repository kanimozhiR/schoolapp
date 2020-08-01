Rails.application.routes.draw do
  devise_for :users
  resources :teachers
  resources :subjects
  resources :students
  resources :klasses
  resources :marks do
      get :initiate_rank, on: :collection
	end
	root to: "klasses#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
