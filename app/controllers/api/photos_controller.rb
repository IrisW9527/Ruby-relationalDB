class Api::PhotosController < ApiController
	before_action :authenticate_with_token!, only: [:create]

	# /api/photos
	# show all photos
	def index
		render json: Photo.all
	end

	# /api/photos/
	def show
		photo = Photo.find_by(id: params[:id])
		if photo
			render json:photo, include: :comments
		else
			render json: {error: 'photo not found'}, status: 404
		end
	end

	# /api/photos/search?title=image1
	def search 
		photos = Photo.where('title LIKE ?',"%#{params[:title]}%")
		if photos
			render json:photos
		else
			render json: {error: 'photo not found'}, status: 404
		end
	end

	# /api/photos?user_id=1&title=image1&image=placeholder1
	def create
		photo = Photo.new(title: params[:title], image: params[:image], user_id: params[:user_id])
		if photo.save
			render json:photo
		else
			render json: {error: 'photo not found'}, status: 404
		end
	end

end