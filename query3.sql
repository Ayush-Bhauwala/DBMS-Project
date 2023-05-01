CREATE OR REPLACE PROCEDURE GetTenantDetails (
      PropertyID_input IN PropertyTable.PropertyID%TYPE,
      AadhaarID_check IN UserTable.AadhaarID%TYPE,
      Password_check IN UserTable.Login_password%TYPE)

IS
password_matches NUMBER;
is_valid_user NUMBER;
CURSOR tenant_details is 
      SELECT UserTable.AadhaarID, UserTable.Name, UserTable.Age, UserTable.Door_no, UserTable.Street, UserTable.City, UserTable.State, UserTable.Pincode
      from UserTable, PropertyTable, HistoryTable, TenantTable
      WHERE UserTable.AadhaarID = TenantTable.AadhaarID AND
      TenantTable.AadhaarID = HistoryTable.TenantID AND
      HistoryTable.PropertyID = PropertyTable.PropertyID AND
      PropertyTable.PropertyID = PropertyID_input AND
      (HistoryTable.End_date >= trunc(sysdate) OR HistoryTable.End_date IS NULL);
tenant tenant_details%ROWTYPE;

CURSOR phone_details is 
      SELECT PhoneTable.AadhaarID, PhoneTable.Phone
      from UserTable, PropertyTable, HistoryTable, TenantTable, PhoneTable
      WHERE UserTable.AadhaarID = TenantTable.AadhaarID AND
      TenantTable.AadhaarID = HistoryTable.TenantID AND
      HistoryTable.PropertyID = PropertyTable.PropertyID AND
      PropertyTable.PropertyID = PropertyID_input AND
      PhoneTable.AadhaarID = UserTable.AadhaarID AND
      (HistoryTable.End_date >= trunc(sysdate) OR HistoryTable.End_date IS NULL);
phone phone_details%ROWTYPE;

BEGIN
SELECT COUNT(*) INTO password_matches FROM UserTable where AadhaarID=AadhaarID_check and Login_password=Password_check;

IF password_matches > 0 THEN
      SELECT COUNT(*) INTO is_valid_user FROM AdminTable where AadhaarID=AadhaarID_check;

      IF is_valid_user = 0 THEN
            SELECT COUNT(*) INTO is_valid_user FROM PropertyTable WHERE PropertyID=PropertyID_input and OwnerID = AadhaarID_check;
      END IF;

      IF is_valid_user > 0 THEN
            OPEN tenant_details;
            FETCH tenant_details INTO tenant;

            IF (tenant_details%FOUND) THEN
                  -- Print table headers
                  DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------------------------');
                  DBMS_OUTPUT.PUT_LINE('|  Aadhaar ID  |       Name      |  Age  |  Door_no  |        Street        |      City       |      State      |  Pincode  |');
                  DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------------------------');
                  -- Loop through cursor and print each row in a formatted manner
                  WHILE (tenant_details%FOUND) LOOP
                        DBMS_OUTPUT.PUT_LINE('| ' || RPAD(tenant.AadhaarID, 12) ||
                                          ' | ' || RPAD(tenant.Name, 15) ||
                                          ' | ' || RPAD(tenant.Age, 5) ||
                                          ' | ' || RPAD(tenant.Door_no, 9) ||
                                          ' | ' || RPAD(tenant.Street, 20) ||
                                          ' | ' || RPAD(tenant.City, 15) ||
                                          ' | ' || RPAD(tenant.State, 15) ||
                                          ' | ' || RPAD(tenant.Pincode, 9) || ' |'
                                          );
                        FETCH tenant_details INTO tenant;
                  END LOOP;
                  DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------------------------');

                  OPEN phone_details;
                  FETCH phone_details into phone;
                  IF(phone_details%FOUND) THEN
                        DBMS_OUTPUT.PUT_LINE('--------------');
                        DBMS_OUTPUT.PUT_LINE('Phone Numbers:');
                        DBMS_OUTPUT.PUT_LINE('--------------');
                        WHILE (phone_details%FOUND) LOOP
                              DBMS_OUTPUT.PUT_LINE(phone.Phone);
                              FETCH phone_details into phone;
                        END LOOP;

                  ELSE
                        DBMS_OUTPUT.PUT_LINE('No phone numbers found');
                  END IF;      
            ELSE
                  DBMS_OUTPUT.PUT_LINE('No tenant found.');
            END IF;

      
      ELSE
            DBMS_OUTPUT.PUT_LINE('Access not granted.');
      END IF;
ELSE
      DBMS_OUTPUT.PUT_LINE('Incorrect credentials.');
END IF;
END;
/