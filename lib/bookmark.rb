require 'pg'
class Bookmark
attr_reader :id, :title, :url
    def initialize(id, title, url)
        @id = id
        @title = title 
        @url = url
    end

	def self.all
        if ENV['RACK_ENV'] == 'test'
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else
            connection = PG.connect(dbname: 'bookmark_manager')
        end

        result = connection.exec("SELECT * FROM bookmarks;")
        #result.each do |bookmark| p bookmark end
        result.map { |bookmark| Bookmark.new(bookmark["id"], bookmark["title"], bookmark["url"])}
	end

    def self.create(url, title)
        if ENV['RACK_ENV'] == 'test'
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else
            connection = PG.connect(dbname: 'bookmark_manager')
        end

        connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
    end

end