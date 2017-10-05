class PointsController < ApplicationController
  def index
  end

  def import
    Point.import(params[:file])
    redirect_to points_data_url , notice: "data imported"
  end

  def data
    @points=Point.all
  end


  def search

    @points = Point.search(params[:latitude],params[:longitude])
    render "points/results", :points => @points, notice: "Serach complete"

  end

  def results
  end

end
