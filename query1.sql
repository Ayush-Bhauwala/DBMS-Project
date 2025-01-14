CREATE OR REPLACE PROCEDURE InsertPropertyRecord(
    bedroom IN ResidentialTable.Bedroom_no%TYPE,
    fac IN FacilitiesTable.Facility%TYPE,
    userpass IN UserTable.Login_password%TYPE,
    aadhaarID_input IN UserTable.AadhaarID%TYPE,
    Date_available_from IN PropertyTable.Date_available_from%TYPE,
    Date_available_till IN PropertyTable.Date_available_till%TYPE,
    Rent_per_month IN PropertyTable.Rent_per_month%TYPE,
    Percent_annual_hike IN PropertyTable.Percent_annual_hike%TYPE,
    Total_area IN PropertyTable.Total_area%TYPE,
    Plinth_area IN PropertyTable.Plinth_area%TYPE,
    Floor_no IN PropertyTable.Floor_no%TYPE,
    Construction_year IN PropertyTable.Construction_year%TYPE,
    Locality IN PropertyTable.Locality%TYPE,
    City IN PropertyTable.City%TYPE,
    State IN PropertyTable.State%TYPE,
    Pincode IN PropertyTable.Pincode%TYPE
) AS
  v_user_exists NUMBER;
  ismanager NUMBER;
  passvariable UserTable.Login_password%TYPE;
  --v_max_id PropertyTable.PropertyID%TYPE;
  Property_ID PropertyTable.PropertyID%TYPE;
  owner_exists NUMBER;
  isadmin NUMBER;

BEGIN
  
  -- Retrieve the password for the given Aadhaar ID from UserTable
  SELECT Login_password INTO passvariable from UserTable where AadhaarID=aadhaarID_input;

  SELECT COUNT(*) INTO ismanager FROM ManagerTable WHERE AadhaarID = aadhaarID_input;
  SELECT COUNT(*) INTO isadmin FROM AdminTable WHERE AadhaarID = aadhaarID_input;

  IF passvariable=userpass THEN
    --DBMS_OUTPUT.PUT_LINE('IN IF');

    --Check if the user with the given Aadhaar ID is not a manager
    IF ismanager=0 AND isadmin=0 THEN

      --DBMS_OUTPUT.PUT_LINE('IN IF');

      --Check if the given Aadhaar ID exists in UserTable
      SELECT COUNT(*) INTO v_user_exists FROM UserTable WHERE AadhaarID = aadhaarID_input;

      IF v_user_exists > 0 THEN
        -- Retrieve the maximum property ID from PropertyTable and increment it by 1 to get the new property ID
        SELECT NVL(MAX(PropertyID), 0) + 1 INTO Property_ID FROM PropertyTable;
        -- Insert the new record into PropertyTable with the given property details
        INSERT INTO PropertyTable(
          PropertyID, OwnerID, Date_available_from, Date_available_till,
          Rent_per_month, Percent_annual_hike, Total_area, Plinth_area,
          Floor_no, Construction_year, Locality, City, State, Pincode
        )
        VALUES(
          Property_ID, aadhaarID_input, Date_available_from, Date_available_till,
          Rent_per_month, Percent_annual_hike, Total_area, Plinth_area,
          Floor_no, Construction_year, Locality, City, State, Pincode
        );
        -- Insert the owner record into OwnerTable with the newly generated property ID
        SELECT COUNT(*) INTO owner_exists FROM OwnerTable WHERE AadhaarID = aadhaarID_input;
        IF owner_exists=0 THEN
          INSERT INTO OwnerTable (AadhaarID) VALUES (aadhaarID_input);
        END IF;
        -- Insert the facilities record into FacilitiesTable with the newly generated property ID
        INSERT INTO FacilitiesTable (PropertyID, Facility) VALUES (Property_ID, fac);
        -- Insert the residential or commercial record depending on the number of bedrooms
        IF bedroom > 0 THEN
          INSERT INTO ResidentialTable (PropertyID, Bedroom_no) VALUES (Property_ID, bedroom);
        ELSE
          INSERT INTO CommercialTable (PropertyID) VALUES (Property_ID);
        END IF;
        DBMS_OUTPUT.PUT_LINE('New property record inserted successfully.');
      ELSE
        -- If user does not exist, display error message
        DBMS_OUTPUT.PUT_LINE('Error: Aadhaar ID ' || aadhaarID_input || ' does not exist in UserTable.');
          END IF;

      ELSE
          DBMS_OUTPUT.PUT_LINE('Managers / Admin cannot add property');

      END IF;

    ELSE
        DBMS_OUTPUT.PUT_LINE('Incorrect password');


    END IF;
END;
/



















