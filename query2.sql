CREATE OR REPLACE PROCEDURE GetPropertyRecords(
    ownID IN OwnerTable.AadhaarID%TYPE,
    qID IN OwnerTable.AadhaarID%TYPE,
    userpass IN UserTable.Login_password%TYPE
)
AS
    CURSOR property_cursor IS 
        SELECT *
        FROM PropertyTable
        WHERE OwnerID = ownID;
    v_property property_cursor%ROWTYPE;
    passvariable UserTable.Login_password%TYPE;
    ismanager NUMBER;

BEGIN

    SELECT Login_password INTO passvariable from UserTable where AadhaarID=qID;

    SELECT COUNT(*) INTO ismanager FROM ManagerTable WHERE AadhaarID = qID;

    IF passvariable=userpass THEN

        IF ((ismanager>0) or (OwnID=qID)) THEN
            OPEN property_cursor;
            FETCH property_cursor INTO v_property;
            IF (property_cursor%FOUND) THEN
                -- Print table header
                DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
                DBMS_OUTPUT.PUT_LINE('| P_ID |   Owner ID   |   From     |   Till    |  Rent  |  % Hike  |  Total Area  |  Plinth Area  |  Floor No.  |  C_Year |   Locality  |   City   |  State  |');
                DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------------------------------');
                -- Print property details
                LOOP
                    DBMS_OUTPUT.PUT_LINE('| ' || LPAD(v_property.PropertyID, 4) ||
                    ' | ' || LPAD(v_property.OwnerID, 12) || 
                    ' | ' || LPAD(v_property.Date_available_from, 10) || 
                    ' | ' || LPAD(v_property.Date_available_till, 10) || 
                    ' | ' || LPAD(v_property.Rent_per_month, 6) || 
                    ' | ' || LPAD(v_property.Percent_annual_hike, 8) || 
                    ' | ' || LPAD(v_property.Total_area, 12) || 
                    ' | ' || LPAD(v_property.Plinth_area, 13) || 
                    ' | ' || LPAD(v_property.Floor_no, 10) || 
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
