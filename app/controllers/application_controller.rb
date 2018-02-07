class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Response
  include ExceptionHandler

  # For HTML rendering
  include ActionController::MimeResponds
end
