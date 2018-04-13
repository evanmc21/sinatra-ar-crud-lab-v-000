
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all  #grabs all posts and stores in instance variable

    erb :index
  end

  post '/posts/:id' do

    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do

    @post = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do #finds the instance of the model to update using the id from params
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content
end
