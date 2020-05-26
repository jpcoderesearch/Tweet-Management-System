class Api::V1::TweetsController < ApplicationController
	before_action :authenticate_user!

	
	def create
		binding.pry
		tweet = Tweet.new(tweet_params)
		tweet.user_id = current_user.id
		tweet.save
		render json: {:msg => "tweet created successfully "}
	end

	def index
		tweets = Teet.all
		render json: tweets
	end

	def update
		t = Tweet.where(id: params[:id]).first
		t.update_attribute(tweet_params)
		t.save
	end

	def destroy
		t = Tweet.where(id: params[:id]).first
		t.destroy
	end

	private

	def tweet_params
		params.require(:tweets).permit(:id, :comment, :user_id)
	end

end
