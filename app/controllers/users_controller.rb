class UsersController < ApplicationController

    def create
        user=User.create!(user_params)

        if user
            render json: user.to_json(:except => :password)
        else
            render json: "user already exists"
        end
    end

    def show

    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end

    

end
