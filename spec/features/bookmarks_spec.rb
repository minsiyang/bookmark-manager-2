require 'sinatra'

feature "/bookmarks page" do
  scenario "views bookmarks" do

    Bookmark.create(url:'http://www.makersacademy.com', title: "Makers")
    Bookmark.create(url:'http://google.com', title: "Google")
    Bookmark.create(url:'http://twitter.com', title: "Twitter")

    visit '/bookmarks'

    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
    expect(page).to have_link("Google", href: "http://google.com")
    expect(page).to have_link("Twitter", href: "http://twitter.com")
  end
end
