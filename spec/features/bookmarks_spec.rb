require 'sinatra'

feature "/bookmarks page" do
  scenario "views bookmarks" do

    Bookmark.create(url:'http://www.makersacademy.com')
    Bookmark.create(url:'http://google.com')
    Bookmark.create(url:'http://twitter.com')

    visit '/bookmarks'

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://google.com"
    expect(page).to have_content "http://twitter.com"
  end
end
