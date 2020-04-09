class SearchController < ApplicationController

    def index 
        list = User.all + Feminist.all + Post.all
        render json: list
    end
end
