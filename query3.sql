CREATE OR REPLACE PROCEDURE GetTenantDetails (PropertyID IN PropertyTable.PropertyID%TYPE)
AS
BEGIN

SELECT * from UserTable
WHERE UserTable.AadhaarID = TenantTable.AadhaarID AND
      TenantTable.AadhaarID = HistoryTable.TenantID AND
      HistoryTable.PropertyID = PropertyTable.PropertyID AND
      PropertyTable.PropertyID = PropertyID AND
      HistoryTable.End_date >= trunc(sysdate);

END;