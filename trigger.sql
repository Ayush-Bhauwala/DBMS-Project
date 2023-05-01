CREATE OR REPLACE TRIGGER user_trigger
AFTER INSERT OR UPDATE ON UserTable
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO UserHistoryTable (AadhaarID, Name, Age, Door_no, Street, City, State, Pincode, Login_email, Login_password)
    VALUES (:NEW.AadhaarID, :NEW.Name, :NEW.Age, :NEW.Door_no, :NEW.Street, :NEW.City, :NEW.State, :NEW.Pincode, :NEW.Login_email, :NEW.Login_password);
  ELSE
    UPDATE UserHistoryTable
    SET Name = :NEW.Name,
        Age = :NEW.Age,
        Door_no = :NEW.Door_no,
        Street = :NEW.Street,
        City = :NEW.City,
        State = :NEW.State,
        Pincode = :NEW.Pincode,
        Login_email = :NEW.Login_email,
        Login_password = :NEW.Login_password
    WHERE AadhaarID = :NEW.AadhaarID;
  END IF;
END;
/
