class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
