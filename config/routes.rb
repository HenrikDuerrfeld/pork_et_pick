Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pigs do
    resources :bookings, :only [ :new, :create ]
  end
  get "dashboard", to: "bookings#dashboard"
  get "dashboard/bookings/:id", to: "bookings#edit"
  patch "dashboard/bookings/:id", to: "bookings#accept"
end
