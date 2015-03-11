class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.where(email: params[:user][:email]).first
		if user != nil && user.authenticate(params[:user][:password])
			session['user_id']   = user.id.to_s
			redirect_to recommendations_path
		else
			redirect_to new_sessions_path
		end
	end

	def destroy
		session.destroy
		redirect_to root_path
	end

end