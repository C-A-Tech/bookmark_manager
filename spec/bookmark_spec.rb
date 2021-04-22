require 'bookmark'

describe Bookmark do
	describe '.all' do
		it 'returns all bookmarks' do 
      Bookmark.create ('http://www.makersacademy.com')
      Bookmark.create('http://www.destroyallsoftware.com')
      Bookmark.create('http://www.google.com')
      
      bookmarks = Bookmark.all
			
      expect(bookmarks).to eq(["http://www.makersacademy.com", "http://www.destroyallsoftware.com", "http://www.google.com"])
    end
  end

  describe '#create' do
    it 'adds new bookmark to database' do
      Bookmark.create("http://www.youtube.com")
      expect(Bookmark.all).to include("http://www.youtube.com")
    end
  end
end

        
    