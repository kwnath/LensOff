class PagesController < ApplicationController
  before_action :authenticate_user!, :except => [:home, :search]
  def home
    @lenses = Lense.where.not(latitude: nil, longitude: nil)
    # @lense = Lense.find(params[:id])
    @hash = Gmaps4rails.build_markers(@lenses) do |l, marker|
      marker.lat l.latitude
      marker.lng l.longitude
    end
    @search = Lense.new
  end

  def search
    @lenses = Lense.where(nil)
    lenses_params.each do |key, value|
      @lenses = @lenses.public_send(key, value) if value.present?
    end
  end

  def dashboard
  end

  def error_message
  end

  def super
    @users = User.all
  end

  def user_profile
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
  end

  private

  def lenses_params
    params.require(:lense).permit(:name, :description, :address, :price, :condition, :brandname, :aperture_min, :aperture_max, :focal_length_min, :focal_length_max, :image_stabilization, :mount_type, :camera_type, photos: [])
  end

end



# def index
#     @flats = Flat.where.not(latitude: nil, longitude: nil)

#     @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
#       marker.lat flat.latitude
#       marker.lng flat.longitude
#       # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
#     end
#   end
