DROP TABLE IF EXISTS AirplaneServiceContract;
DROP TABLE IF EXISTS AirlineServiceContract;
DROP TABLE IF EXISTS Airplanes;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS Airlines;
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
  UserID INT NOT NULL AUTO_INCREMENT,
  Login VARCHAR(30) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Password VARCHAR(100) NOT NULL,
  UserType VARCHAR (20) NOT NULL,
  IsValidated BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (UserID)
) DEFAULT CHARSET=utf8;
CREATE TABLE Airlines (
  AirlineID INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Country VARCHAR(100) NOT NULL,
  City VARCHAR(100) NOT NULL,
  Rating INT NOT NULL DEFAULT 0,
  PRIMARY KEY (AirlineID),
  FOREIGN KEY (AirlineID) REFERENCES Users(UserID)
) DEFAULT CHARSET=utf8;
CREATE TABLE Services (
  ServiceID INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Country VARCHAR(100) NOT NULL,
  City VARCHAR(100) NOT NULL,
  Rating INT NOT NULL DEFAULT 0,
  PRIMARY KEY (ServiceID),
  FOREIGN KEY (ServiceID) REFERENCES Users(UserID)
) DEFAULT CHARSET=utf8;
CREATE TABLE Airplanes (
  AirplaneID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  ProductionDate DATE NOT NULL,
  MaxOperatingDays INT NOT NULL,
  Owner INT NOT NULL,
  PRIMARY KEY (AirplaneID),
  FOREIGN KEY (Owner) REFERENCES Airlines(AirlineID)
) DEFAULT CHARSET=utf8;
CREATE TABLE AirlineServiceContract (
  ContractID INT NOT NULL UNIQUE AUTO_INCREMENT,
  ServiceID INT NOT NULL,
  AirlineID INT NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  AirlineConfirmed BIT NOT NULL DEFAULT 0,
  ServiceConfirmed BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (ContractID),
  FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID),
  FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
) DEFAULT CHARSET=utf8;
CREATE TABLE AirplaneServiceContract (
  ID INT NOT NULL UNIQUE AUTO_INCREMENT,
  ContractID INT NOT NULL,
  AirplaneID INT NOT NULL,
  Cost INT NOT NULL,
  FOREIGN KEY (ContractID) REFERENCES AirlineServiceContract(ContractID),
  FOREIGN KEY (AirplaneID) REFERENCES Airplanes(AirplaneID)
) DEFAULT CHARSET=utf8;
INSERT INTO `Users` (`UserID`, `Login`, `Email`, `Password`, `UserType`, `IsValidated`) VALUES ('1', 'qwerty', 'qwerty@qwerty.qwerty', 'qwerty', 'airline', b'1'), ('2', 'asdfgh', 'asdfgh@asdfgh.asdfgh', 'asdfgh', 'service', b'1');
INSERT INTO `Airlines` (`AirlineID`, `Name`, `Country`, `City`, `Rating`) VALUES ('1', 'Airline company name', 'RU', 'SPB', '0');
INSERT INTO `Services` (`ServiceID`, `Name`, `Country`, `City`, `Rating`) VALUES ('2', 'The best Service', 'US', 'California', '0');