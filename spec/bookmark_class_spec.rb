require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe ".all" do
    con = PG.connect(dbname: 'bookmark_manager_test')
    
    
    bookmark = Bookmark.create(url:'http://www.makersacademy.com', title: 'Makers')
    Bookmark.create(url:'http://google.com', title: "Google")
    Bookmark.create(url:'http://twitter.com', title: "Twitter")

    list = Bookmark.all

    it "return a list of bookmarks" do
      expect(list.length).to eq 3
      expect(list.first).to be_a Bookmark
      expect(list.first.id).to eq bookmark.id
      expect(list.first.title).to eq "Makers"
      expect(list.first.url).to eq "http://www.makersacademy.com"
      
    end
  end
   
  describe ".create" do
    it "create a new book" do 
      bookmark = Bookmark.create(url: 'http://amazingweb.com', title: 'Amazing')
      persisted_data = persisted_data(id: bookmark.id)
  
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Amazing'
      expect(bookmark.url).to eq 'http://amazingweb.com'
    end
  end
end
