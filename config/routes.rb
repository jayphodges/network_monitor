Rails.application.routes.draw do
    root "home#index"

    get '/auth/:provider/callback', to: 'sessions#create'
    delete "/logout", to: "sessions#destroy"

    resources :dashboard, only: [:index]
    resources :devices
end
