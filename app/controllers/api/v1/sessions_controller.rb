class Api::V1::SessionsController < ApplicationController
	def create
		binding.pry
		user = User.where(email: params[:email]).first

		if user&.valid_password?(params[:password])
			render json: user.as_json(only: [:id, :email, :authentication_token]), status: :created
		else
			head(:unauthorized)
		end
	end

	def destroy
	end
end