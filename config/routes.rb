Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w(index show create) do
      resources :purrs, only: %w(index show)
      resources :replies, only: %w(index show)

      # /users/user_id/purrs/...
      # /users/user_id/replies/...
    end

    resources :purrs, only: %w(index show create destroy)
    resources :replies, only: %w(index show create destroy)
    resources :follows, only: %w(index create drestroy)

    resource :session, only: %w(create destroy)
  end


  root "home#index"

end
