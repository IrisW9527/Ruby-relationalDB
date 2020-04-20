class Api::PhotosController < ApiController
	# before_action :authenticate_with_token!

	# /api/photos
	def index
		render json: current_user.photos.all
	end

	# /api/photos/1
	def show
		photo = current_user.photos.find_by(id: params[:id])
		if photo
			render json:photo, include: :comments
		else
			render json: {error: 'photo not found'}, status: 404
		end
	end

	# /api/photos/search?title=image1
	def search 
		photos = current_user.photos.where('title LIKE ?',"%#{params[:title]}%")
		if photos
			render json:photos
		else
			render json: {error: 'photo not found'}, status: 404
		end
	end

	# /api/photos?user_id=1&title=image1&image=placeholder1
	def create
		photo = current_user.photos.new(title: params[:title], image: params[:image], user_id: params[:user_id])
		if photo.save
			render json:photo
		else
			render json: {error: 'photo not found'}, status: 404
		end
	end

end