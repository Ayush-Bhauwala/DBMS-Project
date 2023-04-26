CREATE OR REPLACE PROCEDURE GetRentHistory(
    PropertyID IN HistoryTable.PropertyID%TYPE,
    AadhaarID_check IN UserTable.AadhaarID%TYPE,
    Password_check IN UserTable.Login_password%TYPE
)
IS
password_matches NUMBER;
is_valid_user NUMBER;
    CURSOR history_cursor IS    
        -- SELECT HistoryTable.PropertyID, HistoryTable.Start_date, HistoryTable.End_date, HistoryTable.TenantID, HistoryTable.Agency_commission, HistoryTable.Rent
        -- FROM UserTable, ManagerTable, OwnerTable, HistoryTable
        SELECT * 
        FROM HistoryTable
        WHERE HistoryTable.PropertyID = PropertyID;
    v_history history_cursor%ROWTYPE;

BEGIN

SELECT COUNT(*) INTO password_matches FROM UserTable WHERE AadhaarID = AadhaarID_check AND Login_password = Password_check;
    
IF password_matches > 0 THEN
    SELECT COUNT(*) INTO is_valid_user FROM ManagerTable, OwnerTable WHERE OwnerTable.AadhaarID = AadhaarID_check OR ManagerTable.AadhaarID = AadhaarID_check;

    IF is_valid_user > 0 THEN
        OPEN history_cursor;
        FETCH history_cursor INTO v_history;

        IF (history_cursor%FOUND) THEN 
            -- Print property details
            DBMS_OUTPUT.PUT_LINE('Property ID: ' || v_history.PropertyID);
            DBMS_OUTPUT.PUT_LINE('Start Date: ' || v_history.Start_date);
            DBMS_OUTPUT.PUT_LINE('End Date: ' || v_history.End_date);
            DBMS_OUTPUT.PUT_LINE('Tenant ID: ' || v_history.TenantID);
            DBMS_OUTPUT.PUT_LINE('Agency Commission: ' || v_history.Agency_commission);
            DBMS_OUTPUT.PUT_LINE('Rent: ' || v_history.Rent);

            -- Print table headers
                  DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------');
                  DBMS_OUTPUT.PUT_LINE('|  Property ID  |    Start_date    |    End_date    |    TenantID    |   Agency_commission   |    Rent    |');
                  DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------');
                   -- Loop through cursor and print each row in a formatted manner
                  WHILE (history_cursor%FOUND) LOOP
                        DBMS_OUTPUT.PUT_LINE('| ' || RPAD(v_history.PropertyID, 12) ||
                                          ' | ' || RPAD(v_history.Start_date, 15) ||
                                          ' | ' || RPAD(v_history.End_date, 15) ||
                                          ' | ' || RPAD(v_history.TenantID, 12) ||
                                          ' | ' || RPAD(v_history.Agency_commission, 10) ||
                                          ' | ' || RPAD(v_history.Rent, 5) || ' |'
                                          );
                        FETCH tenant_details INTO v_history;
                  END LOOP;
                  DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------');

        ELSE
            DBMS_OUTPUT.PUT_LINE('No rent history found for the given property');
        END IF;

        CLOSE history_cursor;

    ELSE 
        DBMS_OUTPUT.PUT_LINE('Acces not granted.');
    END IF;

ELSE
    DBMS_OUTPUT.PUT_LINE('Incorrect credentials.');
END IF;
    
END;
/

EXEC GetRentHistory(101);