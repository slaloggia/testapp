class ThingsController < ApplicationController

    def index
        things = Thing.all
        render json: things
    end

    def show
        thing = Thing.find(params[:id])
        render json: thing
    end

    def create
        thing = Thing.create(name: params[:name])
        render json: thing
    end

    def update
        thing = Thing.find(params[:id])
        thing.update(name: params[:name])
        thing.save
        render json: thing
    end

    def destroy
        thing = Thing.find(params[:id])
        thing.destroy
        render json: thing
    end

end
