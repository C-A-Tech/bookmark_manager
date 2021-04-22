feature 'Add bookmark' do
    scenario 'add a new bookmark and expect to see bookmark on page' do
        visit ('/')
        click_button('Add New')
        fill_in "url", with: "www.youtube.com"
        click_button ('Submit')
        expect(page).to have_content ("www.youtube.com")
    end
end