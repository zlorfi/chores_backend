module V1
  class ChoresController < ApplicationController
    # GET /v1/chores
    def index
      @chores = Chore.all
      json_response(@chores)
    end

    # GET /v1/chores/today
    def today
      today = Date.today.strftime('%A').downcase
      @chores = Chore.where(today => true) # .pluck(:title)
      json_response(@chores)
    end

    # GET /v1/chores/:weekday
    def weekday
      return json_response([], :not_found) unless Chore::WEEK_DAYS.include?(params[:weekday])

      @chores = Chore.where(params[:weekday] => true)
      json_response(@chores)
    end
  end
end
