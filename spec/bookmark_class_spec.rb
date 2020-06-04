require 'bookmark'

describe Bookmark do

  describe ".all" do
    con = PG.connect :dbname => 'bookmark_manager_test'
    
    con.exec "INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');"
    con.exec "INSERT INTO bookmarks (url, title) VALUES ('http://google.com', 'Google');"
    con.exec "INSERT INTO bookmarks (url, title) VALUES ('http://twitter.com', 'Twitter');"

    list = Bookmark.all

    it "return a list of bookmarks" do
      expect(list).to include("http://www.makersacademy.com")
      expect(list).to include("http://google.com")
      expect(list).to include("http://twitter.com")
    end
  end
   
  describe ".create" do
    it "create a new book" do
      Bookmark.create(url:'http://amazingweb.com', title:'amazing')
      expect(Bookmark.all).to include("http://amazingweb.com")
    end
  end
end
