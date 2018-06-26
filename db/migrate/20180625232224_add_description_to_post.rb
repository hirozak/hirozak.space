class AddDescriptionToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :description, :string, null: false
  end
end
