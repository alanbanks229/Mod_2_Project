class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :content
      t.text :title

      t.timestamps
    end
  end
end
