class CommentsController < ApplicationController
    post '/comments' do
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
  
    private
  
    def comment_params
      params.require(:comments).permit(:content)
    end
  
    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end      
  
    def current_article
      Article.find(params[:article_id]) if params[:article_id]
    end
      
end
  