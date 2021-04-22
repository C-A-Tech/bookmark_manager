require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
	configure :development do 
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
		fake_bookmark = Bookmark.new(12, 'Google', 'http://google.com')
		p fake_bookmark
	end

	run! if app_file == $0
end