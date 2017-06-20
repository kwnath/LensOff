class CreateLenses < ActiveRecord::Migration[5.0]
  def change
    create_table :lenses do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :condition

      t.timestamps
    end
  end
end
