Rails.application.routes.draw do

  resources :messages, only: [:index, :create, :show, :edit, :update]
  
  resources :reports do
    resources :messages, only: [:new]
  end
  
  # resources :reports, only: [], path: "r/" do
  #   collection do
  #     get :show_by_key, path: "/"
  #   end
  # end
  resources :parts
  
  get "r/:key" => "reports#show_by_key", as: "show_by_key_reports"
  get "m/:key" => "messages#show_by_key", as: "show_by_key_messages"
  
    #
  # namespace :api do
  #   namespace :v1 do
  #     resources :trips, except: [:new, :update, :edit]
  #     resources :users, only: [:index]
  #   end
  # end

  devise_for :users
  
  root 'reports#index'
  get 'trips' => 'static_pages#index'
  get 'trips/:id' => 'static_pages#index'

end
