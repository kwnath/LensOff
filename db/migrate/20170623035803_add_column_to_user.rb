class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bio, :string
    add_column :users, :photo_experience, :string
  end
end
