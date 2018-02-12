class AttractionsController < ApplicationController
	#load_and_authorize_resource
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_path, alert: exception.message
	end

	def index
		@attractions = Attraction.all
	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	def new
		@attraction = Attraction.new
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def create
		@attraction = Attraction.new(attraction_params)
		authorize! :create, @attraction
		if @attraction.save
			redirect_to @attraction
		else
			redirect_to :new_attraction
		end
	end

	def ride
		#binding.pry
		ride = Ride.create(attraction_id: params[:attraction_id], user_id: session[:user_id])
		flash[:message] = ride.take_ride
		redirect_to user_path(session[:user_id])
	end

	private
	def attraction_params
		params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
	end
end
