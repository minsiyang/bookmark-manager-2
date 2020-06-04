## Bookmark Manager
Pairing with Sophie B
<br>
First user story:

```
As a user
So that I can view a list of useful websites
I want to be shown a list of bookmarks
```
<br><br>
`As a user
So that I can save a website
I would like to add the site's address bookmark manager
```


Domain model for first user story:
<p align="center">
<img src=/images/Updated_1stDomain_Model.png width=60%>
</p>

### SQL instructions to create 'bookmark_manager' and 'bookmark_manager_test' databases

1 Connect to 'psql' to create databases:
```
  CREATE DATABASE bookmark_manager;
  CREATE DATABASE bookmark_manager_test;
``` 
2 Connect to the database, eg,
```
 \c bookmark_manager;
```
3 Create appropriate table for each database: run SQL query saved in file '01_create_bookmarks_table.sql'