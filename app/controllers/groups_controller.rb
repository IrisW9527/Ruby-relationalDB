class GroupsController < ApplicationController
  def index
  	@group = Group.all
  end

  def show
  	@group = Group.find(group_params)
  end

  private
  def group_params
  	params.require(:group).permit(:name)
  end

end
