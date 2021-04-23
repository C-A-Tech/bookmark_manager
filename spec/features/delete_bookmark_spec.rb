feature 'Delete bookmark' do
  scenario ':User can delete a bookmark' do
    Bookmark.create('http://www.google.com', 'Google')
    Bookmark.create('http://www.makersacademy.com', 'Makers Academy')
    
    visit('/bookmarks')
    
    first('.bookmark').click_button('Delete')
    save_and_open_page
    expect(page).to_not have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
