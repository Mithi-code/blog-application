class RemoveLikesCounter < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :likes_counter, :text
    remove_column :posts, :comments_counter, :text
  end
end
