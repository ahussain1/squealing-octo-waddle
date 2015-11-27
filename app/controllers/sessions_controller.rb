class SessionsController < ApplicationController

	def	new
	end 

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id 
			flash[:success] = "You have sucessfully logged in"
			redirect_to user_path(user)
		else
			flash.now[:danger] = "There was something wrong with your login information"
			render 'new'
		end
	end 

	def destroy 
		session[:user_id] = nil 
		flash[:success] = "You have logged out"
		redirect_to root_path 
	end 
#information is stored in our session hash, and our browser backs this
#we save the user_id in the sessions hash which is backed by our browser's 
#cookies 
end 