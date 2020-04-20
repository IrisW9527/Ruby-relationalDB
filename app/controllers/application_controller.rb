class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	# protect_from_forgery with: :null_session, prepend: true
	helper_method :user_signed_in?, :current_user

	private
    def after_sign_in_path_for(resource)
       "/photos"
    end

end
