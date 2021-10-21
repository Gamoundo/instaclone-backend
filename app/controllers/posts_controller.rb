class PostsController < ApplicationController

    def create
    post=Post.create!(post_params)
    
    end
end
