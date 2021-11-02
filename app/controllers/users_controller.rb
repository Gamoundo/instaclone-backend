class UsersController < ApplicationController

    def create
        user=User.create!(user_params)

        if user
            render json: user.to_json(:except => :password)
        else
            render json: {error: "user already exists"}
        end
    end

    def login
        user = User.find_by(name: user_params[:name])

        if user && user.authenticate(user_params[:password])
            # token = encode_token({user_id: @user.id})
            # render json: {user: @user, token: token}
            render json: user.to_json(:except => :password)
        else
             render json: {error: "Insufficient credentials"} 
        end
    end

    def index
        users = User.all
        render json: users
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end

    

end
