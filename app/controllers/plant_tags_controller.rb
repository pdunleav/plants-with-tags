class PlantTagsController < ApplicationController

  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
    @available_tags = Tag.all - @plant.tags
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @tag_ids = params[:plant_tag][:tag]
    @tag_ids.each do |tag_id|
      tag = Tag.find(tag_id)
      PlantTag.create(plant: @plant, tag: tag)
    end
    redirect_to garden_path(@plant.garden)
  end
end
