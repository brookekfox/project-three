class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.where(email: params[:user][:email]).first
		if user != nil && user.authenticate(params[:user][:password])
			session['user_id'] = user.id.to_s
			@current_user = User.find(session['user_id'])
			redirect_to user_path(session['user_id'])
		else
			redirect_to new_sessions_path
		end
	end

	def destroy
		session.destroy
		redirect_to new_sessions_path
	end

end