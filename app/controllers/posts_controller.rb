class PostsController < ApplicationController


    def index
        render json: Post.all
    end

    def show
        render json: Post.find(params[:id])
    end

    def create
        payload = post_params.merge({user_id: active_user.id})
        post = Post.create(payload)
        if post.valid?
            render json: post
        else
            render json: {errors:  post.errors.full_messages}
        end
    end

    def update 
        like = Post.find(params[:id]).likes.find { |l| l.user_id == active_user.id }
        if like 
            like.destroy
            render json: Post.find(params[:id])
        else
            l = Like.create(post_id: params[:id], user_id: active_user.id)
            render json: l.post
        end
    end


    private 
    def post_params
        params.require(:post).permit(:title, :content)
    end
end
