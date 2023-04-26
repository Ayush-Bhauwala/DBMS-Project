CREATE OR REPLACE PROCEDURE SearchPropertyForRent(City_input IN PropertyTable.City%TYPE)
AS
    CURSOR property_cursor IS
        SELECT p.PropertyID, p.OwnerID, p.Date_available_from, p.Date_available_till,
               p.Rent_per_month, p.Percent_annual_hike, p.Total_area, p.Plinth_area,
               p.Floor_no, p.Construction_year, p.Locality, p.City, p.State, p.Pincode
        FROM PropertyTable p
        LEFT OUTER JOIN HistoryTable h ON p.PropertyID = h.PropertyID
        WHERE p.City = City_input
        AND
        (
        h.Start_date IS NULL
        OR
        trunc(sysdate) BETWEEN h.Start_date AND h.End_date
        );
    v_property property_cursor%ROWTYPE;

BEGIN

    OPEN property_cursor;
    FETCH property_cursor INTO v_property;
    IF (property_cursor%FOUND) THEN 

        -- Print table header
                DBMS_OUTPUT.PUT_LINE('+---------------+---------------+----------------------+----------------------+-----------------+----------------------+----------------+----------------+-----------+------------------+------------+------------+------------+');
                DBMS_OUTPUT.PUT_LINE('| Property ID   | Owner ID      | Date Available From  | Date Available Till  | Rent per Month  | Percent Annual Hike  | Total Area     | Plinth Area    | Floor No. | Construction Year | Locality   | City       | State      |');
                DBMS_OUTPUT.PUT_LINE('+---------------+---------------+----------------------+----------------------+-----------------+----------------------+----------------+----------------+-----------+------------------+------------+------------+------------+');
                
                -- Print property details
                WHILE (property_cursor%FOUND) LOOP
                    DBMS_OUTPUT.PUT_LINE('| ' || LPAD(v_property.PropertyID, 13) || ' | ' || LPAD(v_property.OwnerID, 13) || ' | ' || LPAD(v_property.Date_available_from, 20) || ' | ' || LPAD(v_property.Date_available_till, 20) || ' | ' || LPAD(v_property.Rent_per_month, 15) || ' | ' || LPAD(v_property.Percent_annual_hike, 22) || ' | ' || LPAD(v_property.Total_area, 14) || ' | ' || LPAD(v_property.Plinth_area, 14) || ' | ' || LPAD(v_property.Floor_no, 9) || ' | ' || LPAD(v_property.Construction_year, 18) || ' | ' || LPAD(v_property.Locality, 11) || ' | ' || LPAD(v_property.City, 11) || ' | ' || LPAD(v_property.State, 11) || ' | ');
                    FETCH property_cursor INTO v_property;
                END LOOP;

                -- Print table footer
                DBMS_OUTPUT.PUT_LINE('+---------------+---------------+----------------------+----------------------+-----------------+----------------------+----------------+----------------+-----------+------------------+------------+------------+------------+');

    ELSE
        -- Print message if no properties are found
        DBMS_OUTPUT.PUT_LINE('There is no property in this city.');
    END IF;
    CLOSE property_cursor;

END;
/
EXEC SearchPropertyForRent('Bangalore');