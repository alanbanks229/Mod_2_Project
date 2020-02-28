class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.integer :user_id
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
