# class CommentsController < Sinatra::Base
#     def create
#       comment_params = params.require(:comment).permit(:content, :article_id)
      
#       comment = Comment.new(comment_params)
            
#       # Save the comment
#       if comment.save
#         render json: { message: 'Comment saved successfully!' }, status: :ok
#       else
#         render json: { error: 'Error saving comment' }, status: :unprocessable_entity
#       end
#     end
#   end
# class CommentsController < Sinatra::Base
#     post '/comments' do
#       comment = Comment.new(comment_params)
  
#       if comment.save
#         redirect "/articles/#{comment.article_id}" 
#       else
#         flash[:error] = 'Error saving comment'
#         redirect back 
#       end
#     end
  
#     private
  
#     def comment_params
#       params.require(:comment).permit(:content, :user_id, :article_id)
#     end
#   end

class CommentsController < Sinatra::Base
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
      params.require(:comment).permit(:content)
    end
  
    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end
      
  
    def current_article
        Article.find(params[:article_id]) if params[:article_id]
    end
      
end
  
  
  