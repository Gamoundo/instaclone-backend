class PostsController < ApplicationController

    def index
        posts=Post.all
        render json: posts
    end
    
    def create
    post=Post.create!(caption: post_params["caption"] )
    post.avatar.attach(post_params["photo"])
    post.photo= url_for(post.avatar)

        if post.save
            render json: post
        else
            render json: post.errors
        end
    
    end

    private

    def post_params
        params.permit(:photo, :caption)
    end
end
