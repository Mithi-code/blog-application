RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
    before(:each) do
      @first_user = User.create(name: 'Sam', photo: 'profile_photo.link', bio: 'bio', posts_counter: 0,
                                email: 'testing@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'testing@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @post1 = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                           author: @first_user)
      @post2 = Post.create(title: 'Second Post', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
                           author: @first_user)
      @post3 = Post.create(title: 'Third Post', text: 'This is my third post', comments_counter: 0, likes_counter: 0,
                           author: @first_user)
      @post4 = Post.create(title: 'Fourth Post', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0,
                           author: @first_user)
      @comment1 = Comment.create(text: 'Hello Everyone!', author: User.first, post: Post.first)
      @comment2 = Comment.create(text: 'Hello Sam!', author: User.first, post: Post.first)
      @comment3 = Comment.create(text: 'Helloo!', author: User.first, post: Post.first)

      visit(user_posts_path(@first_user.id))
    end

    
  end
end
