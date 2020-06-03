require 'pg'

def empty_database
  con = PG.connect :dbname => 'bookmark_manager_test'

  con.exec "TRUNCATE TABLE bookmarks"
end
