class PagesController < ApplicationController
  def home
    @lenses = Lense.where.not(latitude: nil, longitude: nil)
    # @lense = Lense.find(params[:id])
    @hash = Gmaps4rails.build_markers(@lenses) do |l, marker|
      marker.lat l.latitude
      marker.lng l.longitude
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
end



# def index
#     @flats = Flat.where.not(latitude: nil, longitude: nil)

#     @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
#       marker.lat flat.latitude
#       marker.lng flat.longitude
#       # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
#     end
#   end
