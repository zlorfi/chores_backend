module V1
  class TasksController < ApplicationController
    # PATCH /v1/tasks/:id
    def update
      task = Task.find(params[:id])
      task.update!(attributes: task_params.to_h)
      json_response(nil, :no_content)
    end

    private

    def task_params
      params.permit(:done)
    end
  end
end
