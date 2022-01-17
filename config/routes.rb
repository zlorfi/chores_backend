Rails.application.routes.draw do
  namespace :v1 do
    resources :chores, only: [:index] do
      collection do
        get :today
        get ':weekday' => 'chores#weekday'
      end
    end

    get 'day/today' => 'days#today'

    resources :tasks, only: [:update]
  end
end
