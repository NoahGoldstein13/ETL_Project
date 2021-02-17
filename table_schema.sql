-- creating tablse schema to load data from CSV
CREATE TABLE streaming_data (
id Serial PRIMARY KEY,
title VARCHAR,
age VARCHAR,
imdb FLOAT,
rotten_tomatoes VARCHAR,
director VARCHAR,
genres VARCHAR,
country VARCHAR,
language VARCHAR,
runtime FLOAT ,
on_platforms_besides_netflix VARCHAR,
title_for_join VARCHAR
);

CREATE TABLE netflix_data (
id Serial PRIMARY KEY,
netflix_title VARCHAR,
movie_cast VARCHAR,
date_added_to_netflix VARCHAR,
release_year INT,
maturity_rating VARCHAR,
description VARCHAR,
title_for_join VARCHAR 
);


CREATE TABLE tmdb_data (
id Serial  PRIMARY KEY,
title VARCHAR,
overview VARCHAR,
vote_average FLOAT,
title_for_join VARCHAR
);

-- checking data loaded 
select*
from netflix_data

select*
from tmdb_data

select*
from streaming_data

-- combining the 3 databases
Select *
From netflix_data as n
Inner Join streaming_data as s
On n.title_for_join = s.title_for_join
Left Join tmdb_data as tmdb
On tmdb.title_for_join = n.title_for_join

-- checking how many movies successfully joined 
Select Count (*)
From netflix_data as n
Inner Join streaming_data as s
On n.title_for_join = s.title_for_join
Left Join tmdb_data as tmdb
On tmdb.title_for_join = n.title_for_join


