CREATE OR REPLACE PROCEDURE CreateNewUser(
    aadhaarID_input IN UserTable.AadhaarID%TYPE
    AadhaarID IN UserTable.AadhaarID%TYPE,
    Name IN UserTable.Name%TYPE,
    Age IN UserTable.Age%TYPE,
    Door_no IN UserTable.Door_no%TYPE,
    Street IN UserTable.Street%TYPE,
    City IN UserTable.City%TYPE,
    State IN UserTable.State%TYPE,
    Pincode IN UserTable.Pincode%TYPE,
    Login_email IN UserTable.Login_email%TYPE,
    Login_password IN UserTable.Login_password%TYPE
)
AS
  v_user_exists NUMBER;
BEGIN
  -- Check if the given Aadhaar ID is of admin
SELECT COUNT(*) INTO v_user_exists FROM AdminTable WHERE AadhaarID = aadhaarID_input;

  IF v_user_exists > 0 THEN
    -- If user exists, insert a new record into UserTable with the given property details
    INSERT INTO UserTable (
      AadhaarID, Name, Age, Door_no, Street, City, State, Pincode, Login_email, Login_password
    )
    VALUES(
      AadhaarID, Name, Age, Door_no, Street, City, State, Pincode, Login_email, Login_password
    );

    DBMS_OUTPUT.PUT_LINE('New user created successfully.');
  ELSE
    -- If user does not exist, display error message
    DBMS_OUTPUT.PUT_LINE('Error: Only admin can create user!');
  END IF;
END;
/


-- INSERT INTO UserTable VALUES ('123456789012', 'John Smith', 30, 101, 'Main St', 'Anytown', 'California', '123456', 'johnsmith@example.com', 'password123');


-- INSERT INTO UserTable VALUES ('987654321098', 'Jane Doe', 25, 202, 'Oak St', 'Sometown', 'New York', '654321', 'janedoe@example.com', 'pass1234');

-- BEGIN
--   InsertPropertyRecord(
--     aadhaarID_input => '123456979012',
--     PropertyID => 101,
--     Name => TO_DATE('2023-05-01', 'YYYY-MM-DD'),
--     Age => TO_DATE('2024-04-30', 'YYYY-MM-DD'),
--     Door_no => 20000,
--     Street => 5,
--     City => 1500,
--     State => 1200,
--     Pincode => 3,
--     Login_email => 2015,
--     Login_password => 'Koramangala',
--     City => 'Bangalore',
--     State => 'Karnataka',
--     Pincode => '560095'
--   );
-- END;
-- /



-- SHOW ERRORS PROCEDURE InsertPropertyRecord;


















