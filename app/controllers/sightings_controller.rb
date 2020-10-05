class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
  end

  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: sighting, include: [:bird => {:except => [:created_at, :updated_at]}, :location => {:except => [:created_at, :updated_at]}]
    else
      render json: { message: "No sighting found with that ID" }
    end
  end
end
