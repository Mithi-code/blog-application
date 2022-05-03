class Like < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post
  after_save :update_likes_counter

  # A method that updates the likes counter for a post.
  def update_likes_counter
    posts.increment!(:likes_counter)
  end
end
