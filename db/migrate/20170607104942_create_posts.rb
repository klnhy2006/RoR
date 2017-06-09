class CreatePosts < ActiveRecord::Migration[5.1]
  def change
  drop_table :posts
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
