class UsersController < ApplicationController
	def index
		@users = User.all.order('email ASC')
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(params.require(:user).permit(:first_name, :last_name, :email, :twitter, :instagram, :password, :password_confirmation, :avatar))
		if @user.save
			session['user_id'] = @user.id.to_s
			redirect_to user_path(session['user_id'])
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :email, :twitter, :instagram, :password, :password_confirmation, :avatar))
			redirect_to recommendations_path
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end


end