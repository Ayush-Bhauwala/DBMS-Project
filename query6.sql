CREATE OR REPLACE PROCEDURE GetRentHistory(PropertyID IN HistoryTable.PropertyID%TYPE)
AS
BEGIN

SELECT * FROM HistoryTable
WHERE
HistoryTable.PropertyID = PropertyID;

END;