class AddFavoriteToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :favorite, :boolean, default: false
  end
end
