CREATE DATABASE GreenShop;
GO
USE GreenShop

CREATE TABLE Customer (
	cID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	cName nvarchar(50),
	Email nvarchar(50),
	Password nvarchar(50),
	Phone nvarchar(50),
	Address nvarchar(100),
	Role int
);

CREATE TABLE Category (
	cateID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(50),
);

CREATE TABLE Flower (
	fID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	fName nvarchar(50),
	Quantity int,
	Price float,
	cateID int,
	Img nvarchar(50),
	Sale int,
	Vote float,
	CONSTRAINT FK_FlowerCategory FOREIGN KEY (cateID) REFERENCES Category (cateID)
);
CREATE TABLE Comment(
	commentID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	cID int,
	fID int,
	Commentary nvarchar(255),
	CONSTRAINT FK_CommentCustomer FOREIGN KEY (cID) REFERENCES Customer (cID),
	CONSTRAINT FK_CommentFlower FOREIGN KEY (fID) REFERENCES Flower (fID),
);


CREATE TABLE Bill (
	bID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	cID int,
	Total float,
	Payment nvarchar(50),
	Bank nvarchar(50),
	Address nvarchar(100),
	Date nvarchar(50),
	CONSTRAINT FK_BillCustomer FOREIGN KEY (cID) REFERENCES Customer (cID)
);

CREATE TABLE BillDetail (
	bDetailID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	bID int,
	fID int,
	Price float,
	Quantity int,
	Status nvarchar(50),
	CONSTRAINT FK_BillDetail_Flower FOREIGN KEY (fID) REFERENCES Flower (fID),
	CONSTRAINT FK_BillDetail_Bill FOREIGN KEY (bID) REFERENCES Bill (bID),
);


INSERT INTO Customer(cName,Email,Password,Phone,Address,Role) VALUES ('admin','admin','admin',null,null,1)
INSERT INTO Customer(cName,Email,Password,Phone,Address,Role) VALUES ('sale','sale','sale',null,null,2)
INSERT INTO Customer(cName,Email,Password,Phone,Address,Role) VALUES ('shipper','shipper','shipper',null,null,3)

INSERT INTO Category(Name) VALUES (N'Sinh Nhật')
INSERT INTO Category(Name) VALUES (N'Trang Trí')
INSERT INTO Category(Name) VALUES (N'Tiệc Cưới')

INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Khổng Tước','5','200000','1','./Images/spx2-1.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Sơn Liễu','5','200000','2','./Images/spx2-2.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Ngâu','5','340000','3','./Images/spx2-3.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Bàng Singapore','5','500000','1','./Images/spx2-4.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Lan Ý Mỹ','5','430000','2','./Images/spx2-5.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Dây Nhện','5','500000','3','./Images/spx2-6.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Cỏ Lan Chi','5','500000','1','./Images/spx2-7.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Hoa Bỏng','5','250000','2','./Images/spx2-8.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Kim Ngân','5','400000','3','./Images/spx2-9.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Huy Hoàng','5','420000','1','./Images/spx2-10.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Kim Tiền','5','450000','2','./Images/spx2-11.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Hồng Môn','5','150000','3','./Images/spx2-12.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Lan Chi','5','450000','1','./Images/spx2-13.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Lan Ý','5','350000','2','./Images/spx2-14.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Lưỡi Hổ','5','480000','3','./Images/spx2-15.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Môn Quan Âm','5','140000','1','./Images/spx2-1.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Ngọc Ngân','5','300000','2','./Images/spx2-2.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Nha Đam','5','500000','3','./Images/spx2-3.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Phát Lộc','5','450000','1','./Images/spx2-4.png')
INSERT INTO Flower(fName,Quantity,Price,cateID,Img) VALUES (N'Phú Quý','5','170000','2','./Images/spx2-5.png')

