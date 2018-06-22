class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :image, null: false
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
