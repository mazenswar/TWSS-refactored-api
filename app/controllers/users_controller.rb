class UsersController < ApplicationController

    def index
      render json: User.all
    end

    def show
      render json: User.find(params[:id])
    end

    def create
      user = User.create(user_params)
      if user.valid?
       render json: { user: user, token: encode_token(user) }, status: :created
     else
       render json: { error: 'failed to create user' }, status: :not_acceptable
     end
    end

    private

    def user_params
      params.permit(:username, :password, :email, :bio, :profile_img)
    end
end
