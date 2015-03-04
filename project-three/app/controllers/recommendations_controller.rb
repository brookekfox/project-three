class RecommendationsController < ApplicationController

  def index
		@user = User.where(id: session['user_id']).first
		@recommendations = Recommendation.where(user_id_to: session['user_id'])
	end

	def new
		@recommendation = Recommendation.new
	end

	def create
		@recommendation = Recommendation.create(recommendation_params)
		if @recommendation.save && @recommendation.is_public == false
			redirect_to user_path(session['user_id'])
		elsif @recommendation.save && @recommendation.is_public == true
			redirect_to recommendation_path(session['user_id'])
		else
			render 'new'
		end
	end

  def show
		@recommendation = Recommendation.find(params[:id])
  end

  def edit
		@recommendation = Recommendation.find(params[:id])
  end

	def update
		@recommendation = Recommendation.find(params[:id])
		if @recommendation.update_attributes(recommendation_params)
			redirect_to user_path(session['user_id'])
		else
			render 'edit'
		end
	end

	def destroy
		@recommendation = Recommendation.find(params[:id])
		@recommendation.destroy
		redirect_to recommendation_path
	end

	private
		def recommendation_params
			params.require(:recommendation).permit(:social_media, :is_public, :handle, :user_id_to, :user_id, :is_funny, :is_food, :is_news, :is_fashion, :is_sports, :is_tv, :is_film, :is_music, :is_blog)
		end

end
