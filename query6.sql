CREATE OR REPLACE PROCEDURE GetRentHistory(PropertyID IN HistoryTable.PropertyID%TYPE)
AS
    CURSOR history_cursor IS    
        SELECT *
        FROM HistoryTable
        WHERE HistoryTable.PropertyID = PropertyID;
    v_history history_cursor%ROWTYPE;

BEGIN

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
    ELSE
        DBMS_OUTPUT.PUT_LINE('No rent history found for the given property');
    END IF;
    CLOSE history_cursor;
    
END;
/