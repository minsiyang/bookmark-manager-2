require 'bookmark'

describe Bookmark do

  describe ".all" do

    list = Bookmark.all

    it "return a list of bookmarks" do
      expect(list).to include("http://google.com")
      expect(list).to include("http://facebook.com")
      expect(list).to include("http://twitter.com")
    end
  end
end
