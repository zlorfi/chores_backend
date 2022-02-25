module V1
  class ChoresController < ApplicationController
    before_action :authenticate_user!

    # GET /v1/chores
    def index
      chores = Chore.all
      json_response(chores)
    end

    # PATCH /v1/chores/:id
    def update
      return json_response({ error: 'Not allowed' }, :unauthorized) unless current_user.can_edit

      chore = Chore.find(params[:id])
      chore.update!(attributes: chore_params.to_h)
      json_response(chore)
    end

    # GET /v1/chores/today
    def today
      today = Date.today.strftime('%A').downcase
      chores = Chore.for_a_given_day(today) # .pluck(:title)
      json_response(chores)
    end

    # GET /v1/chores/:weekday
    def weekday
      return json_response({}, :not_found) unless Chore::WEEK_DAYS.include?(params[:weekday])

      chores = Chore.for_a_given_day(params[:weekday])
      json_response(chores)
    end

    private

    def chore_params
      params.permit(:title, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end
  end
end
