class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  post '/users' do
    user = User.new(user_params)
    user.password_digest = BCrypt::Password.create(params[:user][:password])
    
    if user.save
      message = "Signup successful".to_json
    else
      message = "Please signup to continue".to_json
      redirect_to '/signup'
    end
  end
    #password_digest handles password encryption and authenitcation 
    #The bcrypt gem is used to handle these

  post 'users/authenticate' do
    user = User.find_by(user_name: params[:username])

    if user && BCrypt::Password.new(user.password_digest) == password
        message = "password is correct".to_json
    else
        message = "incorrect password".to_json
      end
  end

  #get all users
  get '/users' do
    users = User.all
    users.to_json
  end

  get '/articles' do
    articles = Article.all
    articles.to_json(include: {comments: {include: :user} })
  end



  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json
  end


#DELETE /users/:id

delete '/users/:id' do
    user = User.find(params[:id])
    if user.destroy
        message = "User deleted".to_json
    else
        message = "failed to delete user".to_json
    end
  end

  get '/articles' do
    articles = Article.all
    articles.to_json(include: {comments: {include: :user} })
  end

  get '/articles/:id' do
    article = Article.find(params[:id])
    article.to_json(include: {comments: {include: :user} })
  end

post '/articles' do
    article = Article.create(params)
    article.to_json(include: {comments: {include: :user} })
end

patch 'articles/:id' do
    article = Article.find(params[:id])
    article.update(params)
    article.to_json
end

get '/articles/:article_id/comments' do
  article_id = params[:article_id]
  comments = Comment.where(article_id: article_id)
  comments.to_json
end

post '/articles/:article_id/comments' do
  comment = Comment.new(comment_params)
  comment.user = current_user
  comment.article = current_article

  if comment.save
    redirect "/articles/#{comment.article_id}" 
  else
    flash[:error] = 'Error saving comment'
    redirect back 
  end
end

  def like
    article = Article.find(params[:article_id])
    article.likes.create(user_id: current_user.id, interaction_type: 'like')
    article.increment!(:total_likes)
    redirect_to article_path(article)
end

def dislike
    article = Article.find(params[:article_id])
    article.likes.create(user_id: current_user.id, interaction_type: 'dislike')
    article.decrement!(:total_likes)
    redirect_to article_path(article)
end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password)
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end      

    def current_article
      Article.find(params[:article_id]) if params[:article_id]
    end

end
