
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

  get '/models' do
    @posts = Post.all

    erb :index
  end

  post '/posts/:id' do

    @post = Post.find(params[:id])

    erb :show
  end
end
