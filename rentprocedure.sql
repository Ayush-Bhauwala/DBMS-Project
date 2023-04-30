CREATE OR REPLACE PROCEDURE GiveRent(
    property_id IN PropertyTable.PropertyID%TYPE,
    tenant_id IN UserTable.AadhaarID%TYPE,
    enddate IN HistoryTable.End_date%TYPE,
    age_comm IN HistoryTable.Agency_commission%TYPE,
    rent_in IN HistoryTable.Rent%TYPE,
    owner_id_check IN UserTable.AadhaarID%TYPE,
    owner_id_pass IN UserTable.Login_password%TYPE
)
AS
pass_match NUMBER;
BEGIN
    SELECT COUNT(*) INTO pass_match FROM UserTable, OwnerTable where UserTable.AadhaarID=OwnerTable.AadhaarID and UserTable.AadhaarID=owner_id_check and UserTable.Login_password=owner_id_pass;
    IF pass_match > 0 THEN
        INSERT INTO TenantTable VALUES(tenant_id);
        INSERT INTO HistoryTable VALUES(property_id, trunc(sysdate), enddate, tenant_id, age_comm, rent_in);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Access denied.');
    END IF;
END;
/
