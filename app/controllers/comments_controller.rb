class CommentsController < ApplicationController
	before_action :set_photo, only: [:create, :destroy]

	def create
		@comment = @photo.comments.new(comment_params)
		if @comment.save
			redirect_to @photo
		else
			redirect_to @photo, alert: 'unsuccess'
		end
	end

	def destroy
		@comment = @photo.comments.find(params[:id])
		@comment.destroy
		redirect_to @photo
	end

	private
	def set_photo
		@photo = Photo.find(params[:photo_id])
	end

	def comment_params
		params.require(:comment).permit(:description)
	end

end
