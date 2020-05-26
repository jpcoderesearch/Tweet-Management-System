class Api::V1::WelcomeController < ApplicationController
	before_filter :authenticate_user!
	def index
		@val = User.all
		render json: @val
	end
end