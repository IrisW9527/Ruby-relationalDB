class ProfilesController < ApplicationController
  def index
  	@profile = Profile.all
  end

  def show
  	@profile=Profile.find(profile_params)
  end

  private
  def profile_params
  	params.require(:profile).permit(:firstname, :lastname, :bio)
  end


end
