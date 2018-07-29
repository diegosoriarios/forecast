Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  get 'users/sign_out' => 'users#destroy'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
