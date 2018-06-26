class AddJanameToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :name_ja, :string
  end
end
