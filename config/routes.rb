Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  resources :courses
  resources :mentors
  root 'courses#index'
  resources :carts, only: [:create, :index] do 
    # collection is for plurals has_many relationship - does not require id
    # member is for singular - has id
    collection do
      delete('/remove', to: 'carts#destroy')
    end
  end
  resources :orders, only: [:index, :show] 
  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
