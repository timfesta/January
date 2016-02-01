class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		user = User.find_by(email: params[:session])
		if user
			session[:user_id] = user.id
			redirect_to user
		else
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
