CREATE OR REPLACE PROCEDURE SearchPropertyForRent(City IN PropertyTable.City%TYPE)
AS
BEGIN

SELECT * FROM (PropertyTable LEFT OUTER JOIN HistoryTable ON PropertyTable.PropertyID = HistoryTable.PropertyID)
WHERE
PropertyTable.City = City
AND
(
HistoryTable.Start_date = NULL
OR
trunc(sysdate) BETWEEN HistoryTable.Start_date AND HistoryTable.End_date
);

END;