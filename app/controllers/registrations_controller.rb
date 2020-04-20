class RegistrationsController < Devise::RegistrationsController

	private

	def after_sign_up_path_for(resource)
      '/users/sign_in'
    end
 
    # Modified Devise params for user login
    def sign_up_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
