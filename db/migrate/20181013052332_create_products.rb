class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :sub_category, foreign_key: true
      t.string :name
      t.string :slug
      t.string :price
      t.string :code
      t.float :rating
      t.string :origin
      t.string :status
      t.text :description
      t.string :photo_1
      t.string :photo_2
      t.string :photo_3

      t.timestamps
    end
  end
end
