class ApiController < ActionController::Base
	protect_from_forgery with: :null_session
	# protect_from_forgery unless: -> { request.format.json? }
	# before_action :authenticate_user!
	 # Disable CSRF protection
  	skip_before_action :verify_authenticity_token

  	include Authenticable
	
end