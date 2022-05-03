class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, class_name: 'like', foreign_key: 'post_id'
  has_many :comments, class_name: 'comment', foreign_key: 'post_id'
  after_save :update_posts_counter

  # A method that updates the posts counter for a user.
  def update_posts_counter
    author.increment!(:posts_counter)
  end

  # Method which returns the 5 most recent comments for a given post.
  def latest_posts
    comments.limit(5).order(created_at: :desc)
  end
end
