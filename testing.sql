--QUERY 1
--owner already exists
EXEC InsertPropertyRecord(4, 'Basketball Court', 'biryaniislife', '569888466432', '25-JAN-2022', '25-JAN-2024', 4000, 5, 1800, 1500, 2, 2010, 'Jayanagar', 'Bangalore', 'Karnataka', '560062');
--new owner
exec insertpropertyrecord(1, 'court', 'perrytheplatypus', '904835323244', '23-MAY-2023', '23-MAY-2024', 1000, 5, 1200, 600, 1, 2000, 'jack street', 'London', 'Manchester', '349222');
--wrong password
exec insertpropertyrecord(1, 'court', 'perrytheplaypus', '904835323244', '23-MAY-2023', '23-MAY-2024', 1000, 5, 1200, 600, 1, 2000, 'jack street', 'London', 'Manchester', '349222');

--QUERY 2
--owner seeing property records
exec getpropertyrecords('130485445943', '130485445943', 'L_spurs00');
--invalid access
exec getpropertyrecords('130485445943', '798493489489', 'paswr12sword789');
--wrong password
exec getpropertyrecords('130485445943', '130485445943', 'L_spurs0');
--manager seeing property details
exec getpropertyrecords('130485445943', '234567890123', 'password456');

-- QUERY 3
--getting details by owner
exec gettenantdetails(6, '390819111400', 'ilovesachin');
--getting details by admin
exec gettenantdetails(6, '111122223333', 'password123');
--no tenants found
exec gettenantdetails(1, '111122223333', 'password123');
--access not granted
exec gettenantdetails(6, '564825945566', 'henlohenlo');

--QUERY 4
--addding new user by admin
exec createnewuser('111122223333', 'password123', '239837839224', 'Rahul', 20, 23, 'Bellandur', 'Panji', 'Goa', '254322', 'rahul@gmail.com', '432nj23v/lf3487', '9733782342');
--access denied
exec createnewuser('390819111400', 'ilovesachin', '239837839224', 'Rahul', 20, 23, 'Bellandur', 'Panji', 'Goa', '254322', 'rahul@gmail.com', '432nj23v/lf3487', '9733782342');

--QUERY 5
--property that is currently on rent
exec searchpropertyforrent('Bangalore');
--property not on rent
exec searchpropertyforrent('Chicago');

--QUERY 6
--manager getting details
exec getrenthistory(1, '895348394579', 'fbh3289z/p]4');
--owner getting details
exec getrenthistory(1, '567890123456', 'password789');
--access denied
exec getrenthistory(1, '798493489489', 'paswr12sword789');
--incorrect password
exec getrenthistory(1, '567890123456', 'password78');
