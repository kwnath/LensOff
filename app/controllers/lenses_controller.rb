class LensesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  def index
    @lenses = Lense.all
    @search = Lense.new
    end

  def search
    aa = lenses_params[:camera_type]
    bb = lenses_params[:brandname]
    cc = lenses_params[:mount_type]

    if !aa.empty? && !bb.empty? && !cc.empty?
      @lenses = Lense.where(:camera_type => aa, :brandname => bb, :mount_type => cc)
    elsif !aa.empty? && !bb.empty?
      @lenses = Lense.where(:camera_type => aa, :brandname => bb)
    elsif !aa.empty? && !cc.empty?
      @lenses = Lense.where(:camera_type => aa, :mount_type => cc)
    elsif !cc.empty? && !bb.empty?
      @lenses = Lense.where(:mount_type => cc, :brandname => bb)
    elsif !aa.empty?
      @lenses = Lense.where(:camera_type => aa)
    elsif !bb.empty?
      @lenses = Lense.where(:brandname => bb)
    elsif !cc.empty?
      @lenses = Lense.where(:mount_type => cc)
    end


  end

  def show

    @lense = Lense.where.not(latitude: nil, longitude: nil).find(params[:id])
    # @lense = Lense.find(params[:id])



    @hash = Gmaps4rails.build_markers(@lense) do |l, marker|
      marker.lat l.latitude
      marker.lng l.longitude

    end

  end

  def new
    @lense = Lense.new
  end

  def create
    @lense = Lense.new(lenses_params)
    @lense.user = current_user
    if @lense.save
      redirect_to lense_path(@lense)
    else
      render :new
    end
  end

  def edit
    @lense = Lense.find(params[:id])
    if @lense.user == current_user
      render :new
    else
      redirect_to error_lenses_path
    end

  end

  def update
    @lense = Lense.find(params[:id])
    @lense.update(lenses_params)
    redirect_to lense_path(@lense)
  end

  def destroy
    @lense = Lense.find(params[:id])
    if @lense.user == current_user
      @lense.destroy
      redirect_to dashboard_path
    else
      redirect_to error_lenses_path
    end
  end

  private

  def lenses_params
    params.require(:lense).permit(:name, :description, :address, :price, :condition, :brandname, :aperture_min, :aperture_max, :focal_length_min, :focal_length_max, :image_stabilization, :mount_type, :camera_type, photos: [])
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
