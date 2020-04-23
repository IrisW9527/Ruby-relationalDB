class Api::UsersController < ApiController
	# Disable CSRF protection
	before_action :authenticate_with_token!, only: [:update]

  	respond_to :json

  	# api/users/id
 	def show
	    user = User.find(params[:id])
	    if user
			render json: {id: user.id, username: user.username, email: user.email}, status: 200
		else
			render json: {error: 'user not found'}, status: 404
		end
	end

	# api/users?...
	def create
		# user = User.new(user_params)
		user = User.new(email: params[:email], username: params[:username], password: params[:password])
		if user.save
			render json: {message: 'success'},status: 201
			# render json: user, status: 201, location: [:api, user]
			# render json: {username: user.username, email: user.email, password: user.password, password_confirmation: user.password_confirmation}, status: 201
		else
			render json: {error: 'bad request'}, status: 400
		end
	end

	# api/users/id?...
	def update
	    user = current_user

	    if user.update(username: params[:username])
	      render json: {id: user.id, new_username: user[:username]}, status: 200, location: [:api, user]
	      # {message: 'success', changed_username: user.username}
	    else
	      render json: { errors: user.errors }, status: 422
	    end
	end

	# def destroy
	#     current_user.destroy
	#     head 204 # successfully requested but return nothing
	# end

	# private
	# def user_params
	#     params.require(:user).permit(:username, :email,:password, :password_confirmation)
	# end

end