class AddCoordinatesToLenses < ActiveRecord::Migration[5.0]
  def change
    add_column :lenses, :address, :string
    add_column :lenses, :latitude, :float
    add_column :lenses, :longitude, :float
  end
end
