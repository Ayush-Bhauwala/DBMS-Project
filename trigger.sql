CREATE OR REPLACE TRIGGER user_trigger
AFTER INSERT OR UPDATE ON UserTable
FOR EACH ROW
BEGIN
    INSERT INTO UserHistoryTable (AadhaarID, Name, Age, Door_no, Street, City, State, Pincode, Login_email, Login_password)
    VALUES (:NEW.AadhaarID, :NEW.Name, :NEW.Age, :NEW.Door_no, :NEW.Street, :NEW.City, :NEW.State, :NEW.Pincode, :NEW.Login_email, :NEW.Login_password);
END;
/
