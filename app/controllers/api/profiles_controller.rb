class Api::ProfilesController < ApiController
	before_action :authenticate_with_token!

	def show
		profile = Profile.find_by(user_id: params[:user_id])
		if profile
			render json:profile
		else
			render json: {error: 'profile not found'}, status: 404
		end
	end

end
