DROP TABLE ManagerTable;
DROP TABLE AdminTable;
DROP TABLE OwnerTable;
DROP TABLE ResidentialTable;
DROP TABLE CommercialTable;
DROP TABLE FacilitiesTable;
DROP TABLE HistoryTable;
DROP TABLE PropertyTable;
DROP TABLE PhoneTable;
DROP TABLE TenantTable;
DROP TABLE UserTable;
DROP TABLE UserHistoryTable;

create table UserHistoryTable(AadhaarID char(12), Name varchar(15), Age int, Door_no int, Street varchar(30), City varchar(15), State varchar(15), Pincode char(6), Login_email varchar(50) , Login_password varchar(50));

create table UserTable(AadhaarID char(12) primary key, Name varchar(15), Age int, Door_no int, Street varchar(30), City varchar(15), State varchar(15), Pincode char(6), Login_email varchar(50) , Login_password varchar(50));

create table AdminTable(AadhaarID char(12) primary key,CHECK(AadhaarID='111122223333'), foreign key (AadhaarID) references UserTable(AadhaarID) on delete cascade);

create table ManagerTable(AadhaarID char(12) primary key, foreign key (AadhaarID) references UserTable(AadhaarID) on delete cascade);

create table TenantTable(AadhaarID char(12) primary key, foreign key (AadhaarID) references UserTable(AadhaarID) on delete cascade);

create table OwnerTable(AadhaarID char(12) primary key, foreign key (AadhaarID) references UserTable(AadhaarID) on delete cascade);

create table PhoneTable(AadhaarID char(12), Phone char(10),
primary key (AadhaarID, Phone),
foreign key (AadhaarID) references UserTable(AadhaarID) on delete cascade);

create table PropertyTable(
    PropertyID int primary key,
    OwnerID char(12),
    Date_available_from date,
    Date_available_till date,
    Rent_per_month float,
    Percent_annual_hike float,
    Total_area float,
    Plinth_area float,
    Floor_no int,
    Construction_year int,
    Locality varchar(30),
    City varchar(15),
    State varchar(15),
    Pincode char(6),
    CHECK(Percent_annual_hike >=0),
    foreign key(OwnerID) references UserTable
    );

create table FacilitiesTable(
    PropertyID int,
    Facility varchar(50),
    primary key(PropertyID, Facility),
    foreign key(PropertyID) references PropertyTable
);

create table HistoryTable(
    PropertyID INT,
    Start_date DATE,
    End_date DATE,
    TenantID CHAR(12),
    Agency_commission INT,
    Rent float,
    PRIMARY KEY(PropertyID, Start_date),
    FOREIGN KEY(TenantID) REFERENCES TenantTable,
    FOREIGN KEY(PropertyID) REFERENCES PropertyTable
);

create table CommercialTable(
    PropertyID INT PRIMARY KEY,
    FOREIGN KEY(PropertyID) REFERENCES PropertyTable
);

create table ResidentialTable(
    PropertyID INT,
    Bedroom_no INT,
    PRIMARY KEY(PropertyID, Bedroom_no),
    FOREIGN KEY(PropertyID) REFERENCES PropertyTable
);

alter table UserTable add constraint unique_login unique(Login_email);
