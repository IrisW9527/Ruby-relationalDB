class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
  	user = User.find_by(username: params[:user][:username])
  	password = params[:user][:password]

  	if user && user.authenticate(password)
  		session[:user_id]=user.id
  		redirect_to root_path
  	else
  		redirect_to login_path, alert: 'invalid'
  	end

  end

  def destroy
  	reset_session
  	redirect_to login_path
  end
end
