Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             path: 'v1',
             path_names: { sign_in: 'login', sign_out: 'logout' },
             controllers: { sessions: 'v1/sessions' } do
    post 'sign_in', to: 'devise/sessions#create'
  end

  namespace :v1, defaults: { format: :json } do
    resources :chores, only: [:index] do
      collection do
        get :today
        get ':weekday' => 'chores#weekday'
      end
    end

    get 'days/today' => 'days#today'
    get 'days/summary' => 'days#summary'

    resources :tasks, only: [:update] do
      get 'toggle' => 'tasks#toggle'
    end
  end
end
