# Extract, Transform, and Load (Project)

In order to format all of the data in a neat dataframe, we started by selecting columns of interest. We then added a column called “title_for_join” to all of the datasets to lower case, remove spaces, and remove extraneous characters including: “\\`*_{}[]()>#+-.!$:;%&,'/?”. This way we could ultimately use this column to easily join all 3 datasets in the future in postgres. As a final cleansing step, we removed any duplicates (no rows ultimately were deleted in any dataset). We then exported these dataframes to a clean data folder as csvs.

In a fresh jupyter notebook, we loaded in all 3 csvs as dataframes in order to allow us to load them into postgres in a future step. We then renamed columns to remove capitalizations and spaces so that there were no errors with postgres when loaded the data into tables.

Once the dataframes were ready to be loaded into postgres, we developed “create table” schemas within a new database so that postgres could ingest our 3 dataframes. Once our tables were created within postgres, we loaded our dataframes into postgres using the pandas “.to_sql” function. 

Now that we have our data loaded into 3 separate, organized tables in postgres, we had to join them to collect all relevant information into one succinct table. We used an inner join between the streaming sources table and the Netflix movies and shows table to give us all relevant information on movies only on Netflix. We then left joined the TMDb ratings from the popular movies of IMDB dataset to get TMDb ratings for all of our Netflix movies where applicable.

Our final dataset has 3345 Netflix movies with a myriad of attributes. As a sanity check, Netflix currently has 3781 movies on it. Our discrepancy could be due to a few reasons, some of which are: the data is slightly outdated, we could have missed some extraneous characters when cleansing, or some movies in different languages could have been lost during joining. Either way, we take this outcome as a major success.

-------------------------------------------
## Datasets

* Popular movies of IMDB - https://www.kaggle.com/sankha1998/tmdb-top-10000-popular-movies-dataset 
* Movies on Netflix, Prime Video, Hulu and Disney+ - https://www.kaggle.com/ruchi798/movies-on-netflix-prime-video-hulu-and-disney 
* Netflix Movies & TV Shows - https://www.kaggle.com/shivamb/netflix-shows

