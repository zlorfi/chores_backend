module V1
  class DaysController < ApplicationController
    before_action :authenticate_user!

    # GET /v1/days/today
    def today
      @day = Day.find_or_create_by(user_id: current_user.id, created_at: Date.today)
    end

    # GET /v1/days/summary
    def summary
      json_response(Day.summary_last_week(current_user))
    end
  end
end
