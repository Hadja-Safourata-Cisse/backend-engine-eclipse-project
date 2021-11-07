$description
  --7:I have created a new table to store information about the city of cologne
  --14:I select the information of the city of cologne to store
  -- them in my new table
  --15:I add a new cologne to the worldcities table to store the distances
  -- I will calculate
  --25:I calculate the distance between all cities and cologne
  --34:delete the cologne table

$start
  create table ${namePrefix}myCities(
    city VARCHAR(255),
    lat DECIMAL,
    lng DECIMAL, 
    id INTEGER PRIMARY KEY);  
  

  insert into tb_myCities(city,lat,lng,id) select city, lat,lng,id
    from tb_worldcities 
    where city='Cologne';

  ALTER TABLE tb_worldcities  
    ADD distancetocologne DECIMAL default NULL;


  UPDATE tb_worldcities u  --updtate
    set distancetocologne = (select 6371 * acos((sin(w.lat/(180/3.14))*sin(c.lat/(180/3.14))
    + cos(w.lat/(180/3.14))*cos(c.lat/(180/3.14))*cos(c.lng/(180/3.14)-w.lng/(180/3.14))))
    from tb_worldcities w , tb_myCities c where u.id=w.id);
 

 
$kill
  drop table ${namePrefix}myCities;
 
 
 
 


