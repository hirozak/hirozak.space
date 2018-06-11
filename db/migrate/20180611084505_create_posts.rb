class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.text :image
      t.boolean :published, null: false, default: 0
      t.references :user, foreign_key: true, null: false, default: 1
      t.references :category, foreign_key: true, null: false
      t.timestamps
    end
  end
end
