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
        -- Print property details
        DBMS_OUTPUT.PUT_LINE('Property ID: ' || v_property.PropertyID);
        DBMS_OUTPUT.PUT_LINE('Owner ID: ' || v_property.OwnerID);
        DBMS_OUTPUT.PUT_LINE('Date Available From: ' || v_property.Date_available_from);
        DBMS_OUTPUT.PUT_LINE('Date Available Till: ' || v_property.Date_available_till);
        DBMS_OUTPUT.PUT_LINE('Rent per Month: ' || v_property.Rent_per_month);
        DBMS_OUTPUT.PUT_LINE('Percent Annual Hike: ' || v_property.Percent_annual_hike);
        DBMS_OUTPUT.PUT_LINE('Total Area: ' || v_property.Total_area);
        DBMS_OUTPUT.PUT_LINE('Plinth Area: ' || v_property.Plinth_area);
        DBMS_OUTPUT.PUT_LINE('Floor No.: ' || v_property.Floor_no);
        DBMS_OUTPUT.PUT_LINE('Construction Year: ' || v_property.Construction_year);
        DBMS_OUTPUT.PUT_LINE('Locality: ' || v_property.Locality);
        DBMS_OUTPUT.PUT_LINE('City: ' || v_property.City);
        DBMS_OUTPUT.PUT_LINE('State: ' || v_property.State);
        DBMS_OUTPUT.PUT_LINE('Pincode: ' || v_property.Pincode);
    ELSE
        -- Print message if no properties are found
        DBMS_OUTPUT.PUT_LINE('There is no property in this city.');
    END IF;
    CLOSE property_cursor;

END;
/
EXEC SearchPropertyForRent('Bangalore');