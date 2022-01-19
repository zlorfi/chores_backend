Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             path: 'v1',
             path_names: { sign_in: 'login' },
             controllers: { sessions: 'v1/sessions' } do
    post 'sign_in', to: 'devise/sessions#create'
  end

  namespace :v1 do
    resources :chores, only: [:index], defaults: { format: :json } do
      collection do
        get :today
        get ':weekday' => 'chores#weekday'
      end
    end

    get 'days/today' => 'days#today'

    resources :tasks, only: [:update], defaults: { format: :json }
  end
end
