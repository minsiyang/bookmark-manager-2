require 'sinatra'

feature "/bookmarks page" do
  scenario "views bookmarks" do
    con = PG.connect :dbname => 'bookmark_manager_test'

    con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');"
    con.exec "INSERT INTO bookmarks (url) VALUES ('http://google.com');"
    con.exec "INSERT INTO bookmarks (url) VALUES ('http://twitter.com');"

    visit '/bookmarks'

    expect(page).to have_content("http://google.com")
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://twitter.com")
  end
end
