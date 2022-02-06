module V1
  class TasksController < ApplicationController
    before_action :authenticate_user!

    # PATCH /v1/tasks/:id
    def update
      task = Task.find(params[:id])
      task.update!(attributes: task_params.to_h)
      json_response(nil, :no_content)
    end

    # PATCH /v1/tasks/:task_id/toggle
    def toggle
      task = Task.find(params[:task_id])
      task.toggle!(:done)
      json_response(nil, :no_content)
    end

    private

    def task_params
      params.permit(:done)
    end
  end
end
