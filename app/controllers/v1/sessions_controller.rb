module V1
  class SessionsController < Devise::SessionsController
    # POST /v1/login
    def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      json_response({
                      token: ::JwtWrapper.encode(user_id: resource.id),
                      user: current_user.id
                    })
    end
  end
end