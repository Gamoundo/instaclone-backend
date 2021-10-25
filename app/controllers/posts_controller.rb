class PostsController < ApplicationController

    def create
    post=Post.create!(post_params)
    
    end

    private

    def post_params
        params.permit(:photo, :caption)
    end
end
