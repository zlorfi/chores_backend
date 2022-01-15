class ApplicationController < ActionController::API
  include ResponseConcern
  include ExceptionHandlerConcern
end
