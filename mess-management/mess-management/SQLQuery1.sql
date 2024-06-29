CREATE TABLE Admin (
    adminId INT PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Mess (
    messId INT PRIMARY KEY,
    messName VARCHAR(255) NOT NULL,
    messLocation VARCHAR(255) NOT NULL
);

CREATE TABLE [User] (
    userId INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    messId INT,
    FOREIGN KEY (messId) REFERENCES Mess(messId)
);

CREATE TABLE Manager (
    managerId INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    messId INT,
    FOREIGN KEY (messId) REFERENCES Mess(messId)
);

CREATE TABLE MealCount (
    mealId INT PRIMARY KEY,
    messId INT,
    userId INT,
    mealNum INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (messId) REFERENCES Mess(messId),
    FOREIGN KEY (userId) REFERENCES [User](userId)
);

CREATE TABLE MealDeposit (
    depositId INT PRIMARY KEY,
    messId INT,
    userId INT,
    amount DECIMAL(10, 2) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (messId) REFERENCES Mess(messId),
    FOREIGN KEY (userId) REFERENCES [User](userId)
);

CREATE TABLE Cost (
    costId INT PRIMARY KEY,
    messId INT,
    userId INT,
    totalCost DECIMAL(10, 2) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (messId) REFERENCES Mess(messId),
    FOREIGN KEY (userId) REFERENCES [User](userId)
);

CREATE TABLE InventoryAssignment (
    iaId INT PRIMARY KEY,
    messId INT,
    userId INT,
    date DATE NOT NULL,
    FOREIGN KEY (messId) REFERENCES Mess(messId),
    FOREIGN KEY (userId) REFERENCES [User](userId)
);

CREATE TABLE UtilityBill (
    utilityId INT PRIMARY KEY,
    utilityName VARCHAR(255) NOT NULL,
    utilityDate DATE NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    costId INT,
    FOREIGN KEY (costId) REFERENCES Cost(costId)
);
select * from Manager;
