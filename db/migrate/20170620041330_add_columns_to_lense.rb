class AddColumnsToLense < ActiveRecord::Migration[5.0]
  def change
    add_column :lenses, :brandname, :string
    add_column :lenses, :aperture_min, :integer
    add_column :lenses, :aperture_max, :integer
    add_column :lenses, :focal_length_min, :integer
    add_column :lenses, :focal_length_max, :integer
    add_column :lenses, :image_stabilization, :string
    add_column :lenses, :mount_type, :string
    add_column :lenses, :camera_type, :string
  end
end
