class SessionsController < ApplicationController
	def new
		@user = User.new #the new session form is based on a user
	end

	def create
		#find the user by their email
		user = User.where(email: params[:user][:email]).first
		if user != nil && user.authenticate(params[:user][:password])
			session['user_id'] = user.id.to_s #Session is built-in to Rails; it's like a cookie
			@current_user = User.find(session['user_id'])
			redirect_to user_path(session['user_id'])
		else
			redirect_to new_session_path
		end
	end

	def destroy
		session.destroy
		redirect_to new_session_path
	end

end