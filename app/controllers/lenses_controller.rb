class LensesController < ApplicationController

  def index
    @lenses = Lense.all
  end

  def show
    @lense = Lense.find(params[:id])
  end

  def new
    @lense = Lense.new
  end

  def create
    @lense = Lense.create(lenses_params)
    if @lense.save
      redirect_to lenses_path(@lense)
    else
      render :new
    end
  end

  def edit
    @lense = Lense.find(params[:id])
  end

  def update
    @lense = Lense.find(params[:id])
    @lense.update(params[:lense])
    redirect_to lenses_path(@lense)
  end

  def destroy
        @lense = Lense.find(params[:id])
  end

  private

  def lenses_params
    params.require(:lense).permit(:name, :description, :price, :condition, :brandname, :aperture_min, :aperture_max, :focal_length_min, :focal_length_max, :image_stabilization, :mount_type, :camera_type)
  end

end


# lenses GET      /lenses(.:format)                             lenses#index
# POST     /lenses(.:format)                             lenses#create
# new_lense GET      /lenses/new(.:format)                         lenses#new
# edit_lense GET      /lenses/:id/edit(.:format)                    lenses#edit
# lense GET      /lenses/:id(.:format)                         lenses#show
# PATCH    /lenses/:id(.:format)                         lenses#update
# PUT      /lenses/:id(.:format)                         lenses#update
# DELETE   /lenses/:id(.:format)                         lenses#destroy
