class AuthController < ApplicationController
    def login
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
            render json: { user: user, token:  encode_token(user) }
        else
            render json: { errors: "Login unsuccessful"}
        end
    end

    def persist
        if token
            render json: active_user
        end
    end
    
    private

    def login_params
        params.permit(:username, :password)
    end
end