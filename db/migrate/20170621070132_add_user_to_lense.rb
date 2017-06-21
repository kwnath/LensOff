class AddUserToLense < ActiveRecord::Migration[5.0]
  def change
    add_reference :lenses, :user, foreign_key: true
  end
end
