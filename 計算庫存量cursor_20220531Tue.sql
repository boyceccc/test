DROP DATABASE IF EXISTS db20220531;
#purchase sales stock 進貨 銷貨 存貨

CREATE DATABASE db20220531 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE db20220531;

#正規化
CREATE TABLE productin(
  進貨單編號 VARCHAR(4) NOT NULL UNIQUE,
  進貨日期 DATE,
  PRIMARY KEY (進貨單編號)
);

CREATE TABLE productin_detail(
  進貨單編號 VARCHAR(4) NOT NULL,
  貨品編號 VARCHAR(4) NOT NULL,
  進貨數量 INTEGER,
  PRIMARY KEY (進貨單編號, 貨品編號)
);


#計算庫存
#根據每一種貨品進貨數量加總-銷售數量
#請計算出每一種貨品（商品）的庫存量
#商品編號 商品名稱 進貨量 銷貨量 庫存量

CREATE TABLE orders(
  訂單編號 VARCHAR(4) NOT NULL UNIQUE,
  客戶編號 VARCHAR(4) NOT NULL,
  購買日期 DATE,
  運費     INTEGER,
  PRIMARY KEY (訂單編號)
);
#總價=訂單明細資料表.購買數量 * 產品基本資料表.單價
#運費也可以使用計算公式得出出來
#訂單編號O001, 客戶編號C001, 訂購日期2022/04/28
#訂單編號O002, 客戶編號C002, 訂購日期2022/04/29
#訂單編號O003, 客戶編號C003, 訂購日期2022/04/30
#訂單編號O004, 客戶編號C004, 訂購日期2022/05/01
#訂單編號O005, 客戶編號C005, 訂購日期2022/05/02

CREATE TABLE orders_detail(
  訂單編號 VARCHAR(4) NOT NULL,
  產品編號 VARCHAR(4) NOT NULL,
  購買數量 INTEGER,
  PRIMARY KEY (訂單編號, 產品編號)
);

CREATE TABLE customers(
  客戶編號 VARCHAR(4) NOT NULL UNIQUE,
  客戶名稱 VARCHAR(20),
  客戶電話 VARCHAR(12),
  送貨地址 VARCHAR(40),
  PRIMARY KEY (客戶編號)
);

CREATE TABLE products(
  產品編號 VARCHAR(4) NOT NULL UNIQUE,
  產品名稱 VARCHAR(20),
  單位 VARCHAR(2),
  單價 FLOAT,
  供應商編號 VARCHAR(4),
  PRIMARY KEY (產品編號)
);

CREATE TABLE suppliers(
  供應商編號 VARCHAR(4) NOT NULL UNIQUE,
  供應商名稱 VARCHAR(20),
  供應商地址 VARCHAR(40),
  PRIMARY KEY (供應商編號)
);

INSERT INTO productin VALUES ('I001','2022/01/20');
INSERT INTO productin VALUES ('I002','2022/01/02');
INSERT INTO productin VALUES ('I003','2022/01/08');
INSERT INTO productin VALUES ('I004','2022/01/15');
INSERT INTO productin VALUES ('I005','2022/01/30');
INSERT INTO productin VALUES ('I006','2022/01/26');
INSERT INTO productin VALUES ('I007','2022/01/01');
INSERT INTO productin VALUES ('I008','2022/01/01');
INSERT INTO productin VALUES ('I009','2022/01/04');
INSERT INTO productin VALUES ('I010','2022/01/23');

INSERT INTO productin_detail VALUES ('I001','P001',100);
INSERT INTO productin_detail VALUES ('I001','P002',200);
INSERT INTO productin_detail VALUES ('I001','P003',100);
INSERT INTO productin_detail VALUES ('I001','P004',100);
INSERT INTO productin_detail VALUES ('I001','P005',100);
INSERT INTO productin_detail VALUES ('I002','P002',100);
INSERT INTO productin_detail VALUES ('I003','P003',300);
INSERT INTO productin_detail VALUES ('I003','P004',300);
INSERT INTO productin_detail VALUES ('I003','P005',330);
INSERT INTO productin_detail VALUES ('I004','P004',300);
INSERT INTO productin_detail VALUES ('I005','P005',400);
INSERT INTO productin_detail VALUES ('I006','P006',500);
INSERT INTO productin_detail VALUES ('I007','P007',200);
INSERT INTO productin_detail VALUES ('I007','P008',210);
INSERT INTO productin_detail VALUES ('I007','P009',220);
INSERT INTO productin_detail VALUES ('I007','P004',230);
INSERT INTO productin_detail VALUES ('I007','P003',240);
INSERT INTO productin_detail VALUES ('I008','P008',100);
INSERT INTO productin_detail VALUES ('I009','P009',100);
INSERT INTO productin_detail VALUES ('I010','P001',200);
INSERT INTO productin_detail VALUES ('I010','P002',120);
INSERT INTO productin_detail VALUES ('I010','P003',112);
INSERT INTO productin_detail VALUES ('I010','P010',280);

INSERT INTO orders VALUES ('O001','C001','2022/02/20',70);
INSERT INTO orders VALUES ('O002','C002','2022/03/02',0);
INSERT INTO orders VALUES ('O003','C003','2022/03/08',70);
INSERT INTO orders VALUES ('O004','C004','2022/03/15',0);
INSERT INTO orders VALUES ('O005','C005','2022/03/30',70);
INSERT INTO orders VALUES ('O006','C006','2022/03/26',0);
INSERT INTO orders VALUES ('O007','C007','2022/06/01',0);
INSERT INTO orders VALUES ('O008','C005','2022/05/01',0);
INSERT INTO orders VALUES ('O009','C009','2022/04/04',70);
INSERT INTO orders VALUES ('O010','C001','2022/04/23',70);

INSERT INTO orders_detail VALUES ('O001','P001',3);
INSERT INTO orders_detail VALUES ('O001','P002',5);
INSERT INTO orders_detail VALUES ('O001','P003',7);
INSERT INTO orders_detail VALUES ('O001','P004',8);
INSERT INTO orders_detail VALUES ('O001','P005',10);
INSERT INTO orders_detail VALUES ('O002','P002',1);
INSERT INTO orders_detail VALUES ('O003','P003',3);
INSERT INTO orders_detail VALUES ('O003','P004',30);
INSERT INTO orders_detail VALUES ('O003','P005',33);
INSERT INTO orders_detail VALUES ('O004','P004',3);
INSERT INTO orders_detail VALUES ('O005','P005',4);
INSERT INTO orders_detail VALUES ('O006','P006',5);
INSERT INTO orders_detail VALUES ('O007','P007',20);
INSERT INTO orders_detail VALUES ('O007','P008',21);
INSERT INTO orders_detail VALUES ('O007','P009',22);
INSERT INTO orders_detail VALUES ('O007','P004',23);
INSERT INTO orders_detail VALUES ('O007','P003',24);
INSERT INTO orders_detail VALUES ('O008','P008',1);
INSERT INTO orders_detail VALUES ('O009','P009',1);
INSERT INTO orders_detail VALUES ('O010','P001',20);
INSERT INTO orders_detail VALUES ('O010','P002',12);
INSERT INTO orders_detail VALUES ('O010','P003',112);
INSERT INTO orders_detail VALUES ('O010','P010',28);
 
INSERT INTO customers VALUES ('C001','中原1','03-7775409','桃園市中壢區中北路200號');
INSERT INTO customers VALUES ('C002','中原2','03-7765409','台中市西屯區中北路400號');
INSERT INTO customers VALUES ('C003','中原3','03-7755409','台北市天下區中北路300號');
INSERT INTO customers VALUES ('C004','中原4','03-7745409','台北市天下區中北路500號');
INSERT INTO customers VALUES ('C005','中原5','03-7735409','桃園市中壢區西北路200號');
INSERT INTO customers VALUES ('C006','中原6','03-2655409','桃園市中壢區中北路600號');
INSERT INTO customers VALUES ('C007','中原7','03-7715409','桃園市中壢區東北路200號');
INSERT INTO customers VALUES ('C008','中原8','03-7785409','桃園市中壢區西北路800號');
INSERT INTO customers VALUES ('C009','中原9','02-7785409','台北市天下區南北路200號');
INSERT INTO customers VALUES ('C010','中原10','03-7105409','桃園市中壢區中北路1000號');

INSERT INTO products VALUES ('P001','個人電腦','台',30000.0,'S001');
INSERT INTO products VALUES ('P002','筆記型電腦','台',50000.0,'S002');
INSERT INTO products VALUES ('P003','平板電腦','台',18000.0,'S003');
INSERT INTO products VALUES ('P004','iPhone 8手機','支',25000.0,'S004');
INSERT INTO products VALUES ('P005','iPhone 8 plus手機','支',26000.0,'S005');
INSERT INTO products VALUES ('P006','iPhone X手機','支',50000.0,'S006');
INSERT INTO products VALUES ('P007','雷射印表機','台',22000.0,'S007');
INSERT INTO products VALUES ('P008','彩色雷射印表機','台',40000.0,'S008');
INSERT INTO products VALUES ('P009','投影機','台',80000.0,'S009');
INSERT INTO products VALUES ('P010','26吋液晶螢幕','台',15000.0,'S010');

INSERT INTO suppliers VALUES ('S001','中原科技公司','桃園市中壢區中北路100號');
INSERT INTO suppliers VALUES ('S002','天下科技公司','台北市天下區中北路100號');
INSERT INTO suppliers VALUES ('S003','世界科技公司','桃園市世界區中北路300號');
INSERT INTO suppliers VALUES ('S004','和平科技公司','桃園市中壢區中北路100號');
INSERT INTO suppliers VALUES ('S005','為公科技公司','台中市西屯區西北路100號');
INSERT INTO suppliers VALUES ('S006','智慧科技公司','桃園市中壢區中北路100號');
INSERT INTO suppliers VALUES ('S007','資料科技公司','台中市西屯區東北路100號');
INSERT INTO suppliers VALUES ('S008','數據科技公司','台南市中壢區中北路100號');
INSERT INTO suppliers VALUES ('S009','禮運科技公司','高雄市楠梓區中北路100號');
INSERT INTO suppliers VALUES ('S010','房屋科技公司','彰化縣彰化市中北路100號');

DELIMITER $$
DROP PROCEDURE IF EXISTS ProductTA; $$
CREATE PROCEDURE ProductTA (IN stock_date DATE)
BEGIN
	DECLARE productid VARCHAR(4);
	DECLARE productname VARCHAR(20);
	DECLARE saleamount INT;

	DECLARE ProductTA_cur CURSOR FOR 
		SELECT orders_detail.產品編號, products.產品名稱, SUM(orders_detail.購買數量) AS 銷貨量
		FROM orders_detail, orders, products
		WHERE (orders.訂單編號=orders_detail.訂單編號) 
		AND (orders_detail.產品編號=products.產品編號)
		AND (orders.購買日期 < stock_date)
		GROUP BY orders_detail.產品編號
		ORDER BY orders_detail.產品編號; 

	BEGIN
		DECLARE EXIT HANDLER FOR 1146
		BEGIN
			CREATE TABLE db20220531.ProductTA (
				產品編號 VARCHAR(4),
				產品名稱 VARCHAR(20),
				銷貨量 INT
			);
		END;

		DELETE FROM ProductTA;
	END;

	OPEN ProductTA_cur;
	BEGIN
		DECLARE EXIT HANDLER FOR SQLSTATE '02000' BEGIN END;
		
        LOOP
			FETCH ProductTA_cur INTO productid, productname, saleamount;
			INSERT INTO db20220531.ProductTA #插入資料
			VALUES (productid, productname, saleamount);
		END LOOP;
	END;
    
	CLOSE ProductTA_cur;
	SELECT * FROM ProductTA;
END $$
DELIMITER ;

CALL ProductTA('2022/03/02');


DELIMITER $$
DROP PROCEDURE IF EXISTS ProductInTA; $$
CREATE PROCEDURE ProductInTA (IN stock_date DATE)
BEGIN
	DECLARE productinid VARCHAR(4);
	DECLARE productinname VARCHAR(20);
	DECLARE productinamount INT;

	DECLARE ProductInTA_cur CURSOR FOR 
		SELECT productin_detail.貨品編號, products.產品名稱, SUM(productin_detail.進貨數量) AS 進貨量
		FROM productin_detail, productin, db20220531.products
		WHERE (productin.進貨單編號=productin_detail.進貨單編號) 
		AND (productin_detail.貨品編號=db20220531.products.產品編號) 
		AND (productin.進貨日期 < stock_date)
		GROUP BY productin_detail.貨品編號
		ORDER BY productin_detail.貨品編號; 
		
	BEGIN
		DECLARE EXIT HANDLER FOR 1146
		BEGIN
			CREATE TABLE db20220531.ProductInTA (
				進貨產品編號 VARCHAR(4),
				進貨產品名稱 VARCHAR(20),
				進貨量 INT
			);
		END;

		DELETE FROM ProductInTA;
	END;

	OPEN ProductInTA_cur;
	BEGIN
		DECLARE EXIT HANDLER FOR SQLSTATE '02000' BEGIN END;
		
        LOOP
			FETCH ProductInTA_cur INTO productinid, productinname, productinamount;
			INSERT INTO db20220531.ProductInTA
			VALUES (productinid, productinname, productinamount);
		END LOOP;
	END;
    
	CLOSE ProductInTA_cur;
	SELECT * FROM ProductInTA;
END $$
DELIMITER ;

CALL ProductInTA('2022/03/02');

SELECT ProductTA.產品編號, ProductTA.產品名稱, ProductInTA.進貨量, ProductTA.銷貨量,
		(ProductInTA.進貨量-ProductTA.銷貨量) AS 庫存量
FROM ProductTA, ProductInTA
WHERE (ProductTA.產品編號=ProductInTA.進貨產品編號)
ORDER BY ProductTA.產品編號; 
