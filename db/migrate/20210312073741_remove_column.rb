class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts ,:titile, :string
    add_column :posts, :title, :string
  end
end
