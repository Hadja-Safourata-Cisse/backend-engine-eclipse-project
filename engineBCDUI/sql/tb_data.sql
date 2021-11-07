$description
  --4:creation of a table to store the cities
  --23:removal of the city from the worldcities table
  
$start 
  create table ${namePrefix}worldCities ( 
    city VARCHAR(255) ,
    city_ascii VARCHAR(255) ,
    lat DECIMAL,
    lng DECIMAL,
    country VARCHAR(255),
    iso2 VARCHAR(255),
    iso3 VARCHAR(255),
    admin_name VARCHAR (255),
    capital VARCHAR(255) ,
    population DECIMAL,
    id INTEGER
  );        

          
      
$kill
  drop table ${namePrefix}worldCities;
