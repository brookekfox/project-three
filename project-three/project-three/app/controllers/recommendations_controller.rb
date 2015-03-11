class RecommendationsController < ApplicationController

  def index
		@users = User.all
		@recommendations = Recommendation.all.order('created_at DESC')

		@base_url            = 'https://api.instagram.com/v1/users/'
		@search_access_token = 'search?access_token=' + ENV['INSTAGRAM_API_KEY'] + '&q='
		#@query
		@photo_access_token  = '/media/recent?access_token=' + ENV['INSTAGRAM_API_KEY']
		@count               = '&count=1'
	end

	def public
		# @recommendations = Recommendation.all
		@recommendations = Recommendation.all.where(user_id:params[:id]).order('social_media DESC, handle ASC')
		@user = User.find(params[:id])

		@base_url            = 'https://api.instagram.com/v1/users/'
		@search_access_token = 'search?access_token=' + ENV['INSTAGRAM_API_KEY'] + '&q='
		#@query
		@photo_access_token  = '/media/recent?access_token=' + ENV['INSTAGRAM_API_KEY']
		@count               = '&count=1'
	end

	def new
		@recommendation = Recommendation.new
	end

	def create
		@recommendation = Recommendation.create(recommendation_params)
		if (@recommendation.save && @recommendation.is_private == true) || (@recommendation.save && @recommendation.is_private == false)
			redirect_to recommendations_path(session['user_id'])
		# elsif @recommendation.save && @recommendation.is_private == false
		# 	redirect_to recommendations_path(session['user_id'])
		else
			render 'new'
		end
	end

  def show
		@users = User.all
		@recommendation = Recommendation.find(params[:id])

		@base_url            = 'https://api.instagram.com/v1/users/'
		@search_access_token = 'search?access_token=' + ENV['INSTAGRAM_API_KEY'] + '&q='
		#@query
		@photo_access_token  = '/media/recent?access_token=' + ENV['INSTAGRAM_API_KEY']
		@count               = '&count=1'
  end

  def edit
		@recommendation = Recommendation.find(params[:id])
  end

	def update
		@recommendation = Recommendation.find(params[:id])
		if @recommendation.update_attributes(recommendation_params)
			redirect_to recommendations_path(session['user_id'])
		else
			render 'edit'
		end
	end

	def destroy
		@recommendation = Recommendation.find(params[:id])
		@recommendation.destroy
		redirect_to recommendations_path
	end

	private
		def recommendation_params
			params.require(:recommendation).permit(:social_media, :is_private, :handle, :user_id_to, :user_id, :is_funny, :is_food, :is_news, :is_fashion, :is_sports, :is_tv, :is_film, :is_music, :is_blog)
		end

end
