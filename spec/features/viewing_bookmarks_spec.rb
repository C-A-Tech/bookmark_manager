feature 'Viewing bookmarks' do
    scenario 'visiting the index page' do
      visit('/')
      expect(page).to have_content "Bookmark Manager"
    end

    scenario 'A user can see bookmarks' do
      Bookmark.create('http://www.makersacademy.com', 'Makers Academy')
      Bookmark.create('http://www.destroyallsoftware.com', 'Destroy all Software')
      Bookmark.create('http://www.google.com', 'Google')
      
      visit('/bookmarks')
        
      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
      expect(page).to have_link('Destroy all Software', href: 'http://www.destroyallsoftware.com')
      expect(page).to have_link('Google', href: 'http://www.google.com')
    end
  end