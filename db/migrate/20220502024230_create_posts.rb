class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.text :likes_counter
      t.text :comments_conter
      t.references :author, foreign_key: { to_table: 'users' }, index: true

      t.timestamps
    end
  end
end
