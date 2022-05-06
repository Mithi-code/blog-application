class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter

  # A method that updates the posts counter for a user.
 def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  # Method which returns the 5 most recent comments for a given post.
  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
