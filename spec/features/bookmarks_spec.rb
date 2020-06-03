require 'sinatra'

feature "/bookmarks page" do
  xscenario "views bookmarks" do
    visit '/bookmarks'
    expect(page).to have_content("http://google.com")
    expect(page).to have_content("http://facebook.com")
    expect(page).to have_content("http://twitter.com")
  end
end
