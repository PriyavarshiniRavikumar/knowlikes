
						--DDL Commands

-- Create database knowlikes

	CREATE DATABASE knowlikes;
-- To connect the database,

	\c knowlikes

-- create the tables for users, posts, likes;

  - users table=>
	 CREATE TABLE users(userid SERIAL PRIMARY KEY NOT NULL, username VARCHAR NOT NULL);
  - posts table=>
	 CREATE TABLE posts(postid SERIAL PRIMARY KEY NOT NULL, posttext VARCHAR, postdate DATE DEFAULT cast(now() as date), userid integer REFERENCES users(userid));
  - likes table=>
	 CREATE TABLE likes(likeid SERIAL PRIMARY KEY NOT NULL, likedpostid INTEGER REFERENCES posts(postid),likeduserid INTEGER REFERENCES users(userid));
                           --DML Commands
- To insert,

users table

	- INSERT INTO users(username) VALUES('Glenda'),('Paula'),('Edina'),('Colin');

posts table

	- INSERT INTO posts(posttext, userid) VALUES('Forest',1);
	- INSERT INTO posts(posttext, userid) VALUES('BikeSale',1);
	- INSERT INTO posts(posttext, userid) VALUES('Book',1);
	- INSERT INTO posts(posttext, userid) VALUES('Award',1);
	- INSERT INTO posts(posttext, userid) VALUES('Comedy',1);

	- INSERT INTO posts(posttext,postdate,userid) VALUES('Gold','2023-11-08',2);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Awareness','2023-11-09',2);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Experiments','2023-11-10',2);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('LandSale','2023-11-07',2);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Tricks','2023-11-12',2);

	- INSERT INTO posts(posttext,postdate,userid) VALUES('Craft','2023-11-09',3);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Sale','2023-11-09',3);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Design','2023-11-09',3);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Tips','2023-11-09',3);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Lesson','2023-11-09',3);

	- INSERT INTO posts(posttext,postdate,userid) VALUES('Animal','2023-11-10',4);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Cartoon','2023-11-10',4);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Gift','2023-11-10',4);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Meme','2023-11-10',4);
	- INSERT INTO posts(posttext,postdate,userid) VALUES('Craft','2023-11-10',4);

likes table
  
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(3,1);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(3,2),(3,3),(3.4);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(4,3),(4,4);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(5,2),(5,4);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(7,1),(7,3);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(9,1),(9,4);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(11,2),(11,1);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(14,1),(14,2),(14,4);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(17,1),(17,2),(17,3),(17,4);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(18,2),(18,3);
	- INSERT INTO likes(likedpostid, likeduserid) VALUES(19,2),(19,3),(19,1);

## task

1. list all users 


SELECT * from users;

 userid | username
--------+----------
      1 | Glenda
      2 | Paula
      3 | Edina
      4 | Colin
(04 rows)

2. list all posts


 SELECT * from posts;

 postid |   posttext  |  postdate  | userid
--------+-------------+------------+--------
      1 | Forest      | 2023-11-14 |      1
      2 | BikeSale    | 2023-11-14 |      1
      3 | Book        | 2023-11-14 |      1
      4 | Award       | 2023-11-14 |      1
      5 | Comedy      | 2023-11-14 |      1
      6 | Gold        | 2023-11-08 |      2
      7 | Awareness   | 2023-11-09 |      2
      8 | Experiments | 2023-11-10 |      2
      9 | LandSale    | 2023-11-07 |      2
     10 | Tricks      | 2023-11-12 |      2
     11 | Craft       | 2023-11-09 |      3
     12 | Sale        | 2023-11-09 |      3
     13 | Design      | 2023-11-09 |      3
     14 | Tips        | 2023-11-09 |      3
     15 | Lesson      | 2023-11-09 |      3
     16 | Animal      | 2023-11-10 |      4
     17 | Cartoon     | 2023-11-10 |      4
     18 | Gift        | 2023-11-10 |      4
     19 | Meme        | 2023-11-10 |      4
     20 | Craft       | 2023-11-10 |      4
(20 rows)



3. List posts that are liked by colin `


select posts.posttext from posts left join likes on posts.postid = likes.postid where likes.userid = 4;

 posttext
--------------
 Tips
 Cartoon
 Book
 Award
 Comedy
 LandSale
(6 rows)



4. As a Glenda, she wants to know who are all liked her post book. 

select users.username from users inner join likes on users.userid=likes.likeduserid where likes.likedpostid=3;
 
username
-------------------
 Edina
 Colin
 Glenda
 Paula
(4 rows)


5. Edina needs to know the post count which are liked by others.


SELECT COUNT(DISTINCT posts.postid)
FROM posts inner join likes on posts.postid=likes.likedpostid where posts.userid = 1;

 count
-------
     2
(1 row)


6. Paula needs to check the count of awarness and tricks likes count.


SELECT COUNT(likes.likeid)
FROM likes where likes.likedpostid = 7 or likes.likedpostid=10;

 count
-------
     2
(1 row)

7. List Posts of Edina which has likes and also not liked posts.

SELECT posts.posttext FROM posts where posts.userid = 3;

 posttext
-------------
 Craft
 Sale
 Design
 Tips
 Lesson
(5 rows)



8. Search all users posts with Text "Sal"

SELECT * FROM posts
WHERE posts.posttext LIKE '%Sal%';
 postid | postcontent |  postdate  | userid
--------+-------------+------------+--------
      2 | BikeSale    | 2023-11-14 |      1
      9 | LandSale    | 2023-11-09 |      2
     12 | Sale        | 2023-11-08 |      3
(3 rows)


9. Get the count of colin posts

SELECT COUNT(posts.postid)FROM posts
WHERE  posts.userid=4;

   count 
------------------
                5
(1 row)



10. Get count of likes for the post cartoon. user colin

select COUNT(likes.likeid) from likes where likes.likedpostid = 17;
 count
---------------
             4
(1 row)


11. Get the maximum likes posts.

select likedpostid, count(likedpostid) from likes GROUP BY likedpostid HAVING COUNT(likedpostid)>1 order by count(likedpostid) desc limit 2;
 likedpostid | count
-------------+-------
          1  |     4
         17  |     4
(2 rows)



12. In Edina, sort posts by title in forward.
     
 select * from posts where userid=3 ORDER BY posttext;
 postid | posttext    |  postdate  | userid
--------+-------------+------------+--------
     11 | Craft       | 2023-11-09 |      3
     13 | Design      | 2023-11-09 |      3
     15 | Lesson      | 2023-11-09 |      3
     12 | Sale        | 2023-11-09 |      3
     14 | Tips        | 2023-11-09 |      3
(5 rows)


13. In Paula, sort post by date backward.

select * from posts where userid=2 ORDER BY postdate DESC;
 postid | posttext    |  postdate  | userid
--------+-------------+------------+--------
     10 | Tricks      | 2023-11-12 |      2
      8 | Experiments | 2023-11-10 |      2
      7 | Awareness   | 2023-11-09 |      2
      6 | Gold        | 2023-11-08 |      2
      9 | LandSale      | 2023-11-07 |      2
(5 rows)

```

14. Filter today posted posts.

select * from posts where postdate= 'today';
 postid | posttext    |  postdate  | userid
--------+-------------+------------+--------
      1 | Forest      | 2023-11-14 |      1
      2 | BikeSale    | 2023-11-14 |      1
      3 | Book        | 2023-11-14 |      1
      4 | Award       | 2023-11-14 |      1
      5 | Comedy      | 2023-11-14 |      1




(5 row)


