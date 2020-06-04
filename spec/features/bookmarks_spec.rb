require 'sinatra'

feature "/bookmarks page" do
  scenario "views bookmarks" do
    con = PG.connect :dbname => 'bookmark_manager_test'

    con.exec "INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');"
    con.exec "INSERT INTO bookmarks (url, title) VALUES ('http://google.com', 'Google');"
    con.exec "INSERT INTO bookmarks (url, title) VALUES ('http://twitter.com', 'Twitter');"

    visit '/bookmarks'

    expect(page).to have_content("Makers")
    expect(page).to have_content("Google")
    expect(page).to have_content("Twitter")
  end
end
