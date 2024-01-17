use TestDemo

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Name NVARCHAR(100),
    ContactDetails NVARCHAR(100),
);

CREATE TABLE EquipmentRepairRequests (
    RequestID INT PRIMARY KEY,
    EquipmentType NVARCHAR(100),
    SerialNumber NVARCHAR(100),
    ProblemDescription NVARCHAR(500),
    RequestDate DATE,
    Priority INT,
    Status NVARCHAR(50),
    ClientID INT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

CREATE TABLE RepairExecutors (
    ExecutorID INT PRIMARY KEY,
    FName NVARCHAR(100),
	SName NVARCHAR(100),
    Specialization NVARCHAR(100),
    ContactPhone NVARCHAR(20)
);

CREATE TABLE RepairJobs (
    JobID INT PRIMARY KEY,
    RequestID INT,
    ExecutorID INT,
    StartDate DATE,
    EndDate DATE,
    WorkDescription NVARCHAR(500),
    Cost DECIMAL(10, 2),
    FOREIGN KEY (RequestID) REFERENCES EquipmentRepairRequests(RequestID),
    FOREIGN KEY (ExecutorID) REFERENCES RepairExecutors(ExecutorID)
);

CREATE TABLE SpareParts (
    PartID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Price DECIMAL(10, 2),
    StockNumber NVARCHAR(100)
);

CREATE TABLE UsedSpareParts (
    JobID INT,
    PartID INT,
    Quantity INT,
    FOREIGN KEY (JobID) REFERENCES RepairJobs(JobID),
    FOREIGN KEY (PartID) REFERENCES SpareParts(PartID)
);

INSERT INTO Clients (ClientID, Name, ContactDetails) VALUES
(1, 'Илья', '1234567890'),
(2, 'Кира', '0987654321');

INSERT INTO EquipmentRepairRequests (RequestID, EquipmentType, SerialNumber, ProblemDescription, RequestDate, Priority, Status, ClientID) VALUES
(1, 'Printer', 'SN12345', 'Not printing', '2024-01-01', 1, 'Open', 1),
(2, 'Laptop', 'SN67890', 'Screen issue', '2024-01-02', 2, 'Open', 2);

INSERT INTO RepairExecutors (ExecutorID, FName, SName, Specialization, ContactPhone) VALUES
(1, 'Кира', 'Аванская', 'Electronics', '555-0101'),
(2, 'Илья', 'Ефремов', 'Computers', '555-0102');
