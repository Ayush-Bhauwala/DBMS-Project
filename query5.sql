CREATE OR REPLACE PROCEDURE SearchPropertyForRent(City IN PropertyTable.City%TYPE)
AS
    CURSOR property_cursor IS
        SELECT * 
        FROM (PropertyTable LEFT OUTER JOIN HistoryTable ON PropertyTable.PropertyID = HistoryTable.PropertyID)
        WHERE PropertyTable.City = City
        AND
        (
        HistoryTable.Start_date = NULL
        OR
        trunc(sysdate) BETWEEN HistoryTable.Start_date AND HistoryTable.End_date
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