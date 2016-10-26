Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations:  'api/v1/registrations',
    sessions:  'api/v1/sessions'
  }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :status, to: 'api#status'
      resources :users, only: [:show, :update]
    end
  end
end
