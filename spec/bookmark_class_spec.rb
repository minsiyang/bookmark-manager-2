require 'bookmark'

describe Bookmark do

  describe ".all" do
    con = PG.connect :dbname => 'bookmark_manager_test'
    
    con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');"
    con.exec "INSERT INTO bookmarks (url) VALUES ('http://google.com');"
    con.exec "INSERT INTO bookmarks (url) VALUES ('http://twitter.com');"

    list = Bookmark.all

    it "return a list of bookmarks" do
      expect(list).to include("http://www.makersacademy.com")
      expect(list).to include("http://google.com")
      expect(list).to include("http://twitter.com")
    end
  end
end
