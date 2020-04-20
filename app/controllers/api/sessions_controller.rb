class Api::SessionsController < ApiController
	# before_action :authenticate_with_token!

	respond_to :json
 	
 	# /api/sessions?
	def create

	    user_password = params[:password]
	    user_email = params[:email]

	    user = user_email.present? && User.find_by(email: user_email)
	    # user = User.find_by(email: sign_in_params[:email])

	    if user and user.valid_password?(user_password)
	      sign_in user, store: false
	      user.generate_authentication_token!
	      user.save

	      	render json: {id: user.id, email: user.email, password: user.password,created_at: user.created_at,autotoken: user.autotoken}, status: 200
	      
	    else
	    	render json: { errors: "Invalid email or password" }, status: 422
	    end
	end


	# def destroy
	#     user = User.find_by(autotoken: params[:id])
	#     user.generate_authentication_token!
	#     user.save
	#     head 204
	# end


end