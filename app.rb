require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
	configure :development do 
    enable :method_override
		register Sinatra::Reloader
	end

	get '/' do 
		erb :index 
	end 

	get '/bookmarks' do
		@bookmarks = Bookmark.all
		erb :bookmarks
	end

	get '/add_bookmark' do 
		erb :add_bookmark
	end

	post '/bookmarks' do
		Bookmark.create(params[:url], params[:title]) 
		redirect('/bookmarks')
	end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect('/bookmarks')
  end

	run! if app_file == $0
end