class FeministsController < ApplicationController
    def index
        render json: Feminist.all
    end

    def show 
        render json: Feminist.find(params[:id])
    end
end
