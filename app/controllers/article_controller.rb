class ArticleController < ApplicationController
    set :default_content_type, 'application/json'

    get '/articles' do
        articles = Article.all
        articles.to_json(include: {comments: {include: :user} })
    end

    get '/articles/:id'
        article = Article.find(params[:id])
        article.to_json(include: {comments: {include: :user} })
    end

    post '/articles'
        article = Article.create(params)
        article.to_json(include: {comments: {include: :user} })
    end

    patch 'articles/:id'
        article = Article.find(params[:id])
        article.update(params)
        article.to_json
    end
    
end