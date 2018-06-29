class CreatePopularPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :popular_posts do |t|
      t.integer :rank, null: false
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
