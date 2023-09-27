module Api::V1
  class UsersController < ApplicationController
    respond_to :json

    def show
      respond_with User.find(params[:id])
    end

    def create
      user = User.create(user_params)

      if user.save
        render json: user, status: :created, localtion: [:api, user]
      else
        render json: { errors: user.errors }, status: 422
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end