class RestroomsController < ApplicationController
    before_action :set_restroom, only: [:show, :edit, :update, :destroy]
    before_action :admin_only, only: [:edit, :update, :destroy]
    before_action :require_login, only: [:new, :create]

    def index
        @restrooms = Restroom.all
    end

    def new
        @restroom = Restroom.new
    end

    def create
        @restroom = Restroom.new(restroom_params)
        if @restroom && @restroom.save
            redirect_to restroom_path(@restroom)
        else
            flash[:message] = flash_error(@restroom)
            render 'restrooms/new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @restroom.update(restroom_params)
            redirect_to restroom_path(@restroom)
        else
            flash[:message] = flash_error(@restroom)
            render 'restrooms/edit'
        end
    end

    def destroy
    end

    private

    def restroom_params
        params.require(:restroom).permit(:name, :address, :neighborhood_id, tag_ids: [], tags_attributes: [:description])
    end
end