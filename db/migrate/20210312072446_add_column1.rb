class AddColumn1 < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :titile, :string
    add_column :posts, :image_name, :string
    add_column :posts, :content_1, :text
    add_column :posts, :content_2, :text
    add_column :posts, :station, :string
  end
end
