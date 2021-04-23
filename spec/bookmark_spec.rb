require 'bookmark'

describe Bookmark do
	describe '#all' do
		it 'returns all bookmarks' do 
      10.times {Bookmark.create('http://www.makersacademy.com', 'Makers Academy')}
    
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 10
    end
  end

  describe '#create' do
    it 'adds new bookmark to database' do
      Bookmark.create("http://www.youtube.com", "Youtube")
      bookmarks = Bookmark.all

      expect(bookmarks[0].url).to eq("http://www.youtube.com")
      expect(bookmarks[0].title).to eq("Youtube")
    end
  end

  describe '#delete' do
    it 'removes bookmark from database' do
      Bookmark.create("http://www.youtube.com", "Youtube")
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq(1)
      
      Bookmark.delete(bookmarks[0].id)
      # bookmarks[0].delete
      
      expect(bookmarks.length).to eq(0)
      
    end
  end
  # describe '.delete' do
  #   it 'deletes the given bookmark' do
  #     bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
  
  #     Bookmark.delete(id: bookmark.id)
  
  #     expect(Bookmark.all.length).to eq 0
  #   end
  # end
end

        
    