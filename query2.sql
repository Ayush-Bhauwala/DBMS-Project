CREATE OR REPLACE PROCEDURE GetPropertyRecords(
    ownID IN OwnerTable.AadhaarID%TYPE,
    qID IN OwnerTable.AadhaarID%TYPE,
    userpass IN UserTable.Login_password%TYPE
)
AS
    -- Declare a cursor to retrieve the property records of the owner
    CURSOR property_cursor IS 
        SELECT *
        FROM PropertyTable
        WHERE OwnerID = ownID;
    -- Declare a variable to store the property records fetched by the cursor
    v_property property_cursor%ROWTYPE;
    -- Declare a variable to store the login password of the user requesting the property records
    passvariable UserTable.Login_password%TYPE;
    -- Declare a variable to store whether the user requesting the property records is a manager or not
    ismanager NUMBER;

BEGIN
    -- Retrieve the login password of the user requesting the property records
    SELECT Login_password INTO passvariable from UserTable where AadhaarID=qID;

    -- Check if the user requesting the property records is a manager or not
    SELECT COUNT(*) INTO ismanager FROM ManagerTable WHERE AadhaarID = qID;

    -- Check if the login password provided by the user is correct
    IF passvariable=userpass THEN

        -- Check if the user has permission to view the property records
        IF ((ismanager>0) or (OwnID=qID)) THEN
            OPEN property_cursor;
            FETCH property_cursor INTO v_property;

            -- Check if any property records were found
            IF (property_cursor%FOUND) THEN
                -- Print table header
                DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
                DBMS_OUTPUT.PUT_LINE('| P_ID |   From     |    Till    |  Rent  |  % Hike  |  Total  |  Plinth  |  Floors  |  C_Year |   Locality  |   City   |  State  |');
                DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
                -- Print property details
                LOOP
                    DBMS_OUTPUT.PUT_LINE('| ' || LPAD(v_property.PropertyID, 4) ||
                    ' | ' || LPAD(v_property.Date_available_from, 10) || 
                    ' | ' || LPAD(v_property.Date_available_till, 10) || 
                    ' | ' || LPAD(v_property.Rent_per_month, 6) || 
                    ' | ' || LPAD(v_property.Percent_annual_hike, 8) || 
                    ' | ' || LPAD(v_property.Total_area, 7) || 
                    ' | ' || LPAD(v_property.Plinth_area, 8) || 
                    ' | ' || LPAD(v_property.Floor_no, 8) || 
                    ' | ' || LPAD(v_property.Construction_year, 8) || 
                    ' | ' || LPAD(v_property.Locality, 15) || 
                    ' | ' || LPAD(v_property.City, 10) || 
                    ' | ' || LPAD(v_property.State, 10) || 
                    ' | ');
                    FETCH property_cursor INTO v_property;
                    EXIT WHEN property_cursor%NOTFOUND;
                END LOOP;

                -- Print table footer
                DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');

            ELSE
                -- Print message if no properties are found
                DBMS_OUTPUT.PUT_LINE('This person doesn''t own any property.');
            END IF;
            CLOSE property_cursor;
        ELSE
            DBMS_OUTPUT.PUT_LINE('You cannot view the property details with current permissions.');

        END IF;


    ELSE
        DBMS_OUTPUT.PUT_LINE('Incorrect password.');

    END IF;


END;
/



-- EXEC GetPropertyRecords('123456789012','123456789012','password123');
