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
      bookmark = Bookmark.create(url:'http://www.makersacademy.com', title: 'Makers')
      persisted_data = persisted_data(id: bookmark.id)
  
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq "Makers"
      expect(bookmark.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
  
      Bookmark.delete(id: bookmark.id)
  
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')
  
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

end
