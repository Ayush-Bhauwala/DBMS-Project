-- CREATE OR REPLACE PROCEDURE SearchPropertyForRent(City_input IN PropertyTable.City%TYPE)
-- AS
--     CURSOR property_cursor IS
--         SELECT p.PropertyID, p.OwnerID, p.Date_available_from, p.Date_available_till,
--                p.Rent_per_month, p.Percent_annual_hike, p.Total_area, p.Plinth_area,
--                p.Floor_no, p.Construction_year, p.Locality, p.City, p.State, p.Pincode
--         FROM PropertyTable p
--         LEFT OUTER JOIN HistoryTable h ON p.PropertyID = h.PropertyID
--         WHERE p.City = City_input
--         AND
--         (
--         (h.End_date IS NOT NULL AND trunc(sysdate) NOT BETWEEN h.Start_date AND h.End_date)
--         OR
--         h.Start_date IS NULL
--         );
--     v_property property_cursor%ROWTYPE;
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
        (p.PropertyID NOT IN (SELECT PropertyID FROM HistoryTable Hi where Hi.End_date IS NULL OR Hi.End_date>trunc(sysdate)))
        OR
        h.Start_date IS NULL
        );
    v_property property_cursor%ROWTYPE;
BEGIN

    OPEN property_cursor;
    FETCH property_cursor INTO v_property;
    IF (property_cursor%FOUND) THEN 

        -- Print table header
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('| P_ID |    Owner ID    |   From     |    Till    |  Rent  |  % Hike  |  Total  |  Plinth  |  Floors  |  C_Year |   Locality  |  State  |');
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
        -- Print property details
        LOOP
            DBMS_OUTPUT.PUT_LINE('| ' || LPAD(v_property.PropertyID, 4) ||
            ' | ' || LPAD(v_property.OwnerID, 12) || 
            ' | ' || LPAD(v_property.Date_available_from, 10) || 
            ' | ' || LPAD(v_property.Date_available_till, 10) || 
            ' | ' || LPAD(v_property.Rent_per_month, 6) || 
            ' | ' || LPAD(v_property.Percent_annual_hike, 8) || 
            ' | ' || LPAD(v_property.Total_area, 7) || 
            ' | ' || LPAD(v_property.Plinth_area, 8) || 
            ' | ' || LPAD(v_property.Floor_no, 8) || 
            ' | ' || LPAD(v_property.Construction_year, 8) || 
            ' | ' || LPAD(v_property.Locality, 15) || 
            ' | ' || LPAD(v_property.State, 10) || 
            ' | ');
            FETCH property_cursor INTO v_property;
            EXIT WHEN property_cursor%NOTFOUND;
        END LOOP;
    ELSE
        -- Print message if no properties are found
        DBMS_OUTPUT.PUT_LINE('There is no property in this city.');
    END IF;
    CLOSE property_cursor;

END;
/
-- EXEC SearchPropertyForRent('Bangalore');