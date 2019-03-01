class RemoveNameJaFromCategory < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :name_ja, :string
  end
end
