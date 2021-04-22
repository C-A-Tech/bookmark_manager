feature 'Add bookmark' do
    scenario 'add a new bookmark and expect to see bookmark on page' do
        visit ('/')
        click_button('Add New')
        fill_in "url", with: 'http://www.youtube.com'
        fill_in "title", with: 'YouTube'
        click_button ('Submit')
        expect(page).to have_link('YouTube', href:'http://www.youtube.com')
    end
end