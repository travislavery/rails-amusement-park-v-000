class UsersController < ApplicationController
	before_action :signed_in?, only: [:show]

	def home

	end

	def login
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			redirect_to :new_user
		end
	end

	def show
		@user = User.find(session[:user_id])
	end

	def destroy
		session.delete(:user_id)
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :height, :happiness, :tickets, :nausea, :admin)
	end

	def signed_in?
		if !session[:user_id]
			redirect_to root_path
		end
	end


end
