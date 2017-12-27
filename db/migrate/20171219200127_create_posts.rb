class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :tags
      t.string :image
      t.text :body
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
