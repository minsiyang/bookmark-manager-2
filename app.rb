require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Welcome to Bookmark Manager!"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:view_bookmarks)
  end

  get '/add' do
    erb(:add)
  end

  post '/bookmarks' do
    
  end

  run! if app_file == $0

end
