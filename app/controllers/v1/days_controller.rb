module V1
  class DaysController < ApplicationController
    # GET /v1/day/today
    def today
      return json_response([], :not_found) if params[:created_by].blank?
      return json_response([], :not_found) if User.find_by(id: params[:created_by]).blank?

      day = Day.find_or_create_by(user: params[:created_by], created_at: Date.today)
      json_response(day.chores)
    end
  end
end
