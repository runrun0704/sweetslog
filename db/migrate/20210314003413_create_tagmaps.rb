class CreateTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tagmaps do |t|
      t.integer :post_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
