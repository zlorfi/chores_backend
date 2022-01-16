Rails.application.routes.draw do
  namespace :v1 do
    resources :chores, only: [:index] do
      collection do
        get :today
        get ':weekday' => 'chores#weekday'
      end
    end

    resources :days, only: [:show] do
      collection do
        get :today
      end
    end
  end
end
