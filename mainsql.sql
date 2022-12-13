CREATE TABLE tbSport(
    sport_id NUMBER,
    PRIMARY KEY(sport_id),
    sport_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE tbCustomer(
    customer_id NUMBER,
    PRIMARY KEY(customer_id),
    address VARCHAR(255) NOT NULL, 
    gender CHAR(1) NOT NULL CHECK (gender = 'M' or gender = 'F'),
    cust_name VARCHAR(255) NOT NULL CHECK(cust_name !='')
);

CREATE TABLE tbCustPrefSport(
  pref_id NUMBER,
  PRIMARY KEY(pref_id),
  customer_id NUMBER NOT NULL,
  FOREIGN KEY(customer_id) REFERENCES tbCustomer(customer_id),
  sport_id NUMBER NOT NULL,
  FOREIGN KEY(sport_id) REFERENCES tbSport(sport_id)
);

CREATE TABLE tbSupplier(
    supplier_id NUMBER,
    PRIMARY KEY(supplier_id),
    company_name VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255)
);

CREATE TABLE tbProduct(
    product_id NUMBER,
    PRIMARY KEY(product_id),
    price_per_unit NUMBER(10,4) DEFAULT 0,
    amount_in_inv NUMBER DEFAULT 0,
    amount_requested NUMBER DEFAULT 0,
    amount_ordered NUMBER DEFAULT 0
);

CREATE TABLE tbProductSupplier(
    rel_id NUMBER,
    PRIMARY KEY(rel_id),
    product_id NUMBER NOT NULL,
    supplier_id NUMBER NOT NULL,
    FOREIGN KEY(product_id) REFERENCES tbProduct(product_id),
    FOREIGN KEY(supplier_id) REFERENCES tbSupplier(supplier_id)
);

CREATE TABLE tbOrders(
    order_id NUMBER,
    PRIMARY KEY(order_id),
    customer_id NUMBER NOT NULL,
    prod_sup_id NUMBER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES tbCustomer(customer_id),
    FOREIGN KEY(prod_sup_id) REFERENCES tbProductSupplier(rel_id)
);

INSERT INTO tbSport(SPORT_ID, SPORT_NAME)
VALUES(1,'Bodybuilding');

INSERT INTO tbSport(SPORT_ID, SPORT_NAME)
VALUES(2, 'Tennis');

INSERT INTO tbSport(SPORT_ID, SPORT_NAME)
VALUES(3,'Baseball');

INSERT INTO tbSport(SPORT_ID, SPORT_NAME)
VALUES(4,'Boxing');

INSERT INTO tbSport(SPORT_ID, SPORT_NAME)
VALUES(5,'MMA');

INSERT INTO tbSport(SPORT_ID, SPORT_NAME)
VALUES(6,'Swimming');

INSERT INTO tbSport(SPORT_ID, SPORT_NAME)
VALUES(7,'Rugby');

INSERT INTO tbSport(SPORT_ID, SPORT_NAME)
VALUES(8,'Ice Skating');

INSERT INTO tbSport(SPORT_ID, SPORT_NAME)
VALUES(9,'Basketball');

INSERT INTO tbCustomer(CUSTOMER_ID,CUST_NAME,ADDRESS,GENDER)
VALUES(1, 'Faisal Kassem', 'Jana Matejki 21/23', 'M');

INSERT INTO tbCustomer(CUSTOMER_ID,CUST_NAME,ADDRESS,GENDER)
VALUES(2, 'Ruikang Leng', 'Jana Matejki 21/23', 'M');

INSERT INTO tbCustomer(CUSTOMER_ID,CUST_NAME,ADDRESS,GENDER)
VALUES(3, 'Mike Tyson', 'New York, Some Street 21/23', 'M');

INSERT INTO tbCustomer(CUSTOMER_ID,CUST_NAME,ADDRESS,GENDER)
VALUES(4, 'Connor McGregor', 'Ireland, Some Street 22/24', 'M');

INSERT INTO tbCustomer(CUSTOMER_ID, CUST_NAME, ADDRESS, GENDER)
VALUES(5, 'Rocky Balboa', 'New York, Some Street 25/54', 'M');

INSERT INTO tbCustomer(CUSTOMER_ID, CUST_NAME, ADDRESS, GENDER)
VALUES(6, 'Koby Briant', 'California, Some Street 25/22','M');

INSERT INTO tbCustomer(CUSTOMER_ID, CUST_NAME, ADDRESS, GENDER)
VALUES(7, 'Angelina Jolie', 'San Francisco, Some Street', 'F');


INSERT INTO tbCustPrefSport(PREF_ID, CUSTOMER_ID, SPORT_ID)
VALUES(1, 1, 1);

INSERT INTO tbCustPrefSport(PREF_ID, CUSTOMER_ID, SPORT_ID)
VALUES(2, 2, 5);

INSERT INTO tbCustPrefSport(PREF_ID, CUSTOMER_ID, SPORT_ID)
VALUES(3, 3, 4);

INSERT INTO tbCustPrefSport(PREF_ID, CUSTOMER_ID, SPORT_ID)
VALUES(4, 4, 5);

INSERT INTO tbCustPrefSport(PREF_ID, CUSTOMER_ID, SPORT_ID)
VALUES(5, 5, 7);

INSERT INTO tbCustPrefSport(PREF_ID, CUSTOMER_ID, SPORT_ID)
VALUES(6, 5, 1);

INSERT INTO tbCustPrefSport(PREF_ID, CUSTOMER_ID, SPORT_ID)
VALUES(7, 6, 9);

INSERT INTO tbCustPrefSport(PREF_ID, CUSTOMER_ID, SPORT_ID)
VALUES(8, 7, 2);

INSERT INTO tbSupplier(SUPPLIER_ID,COMPANY_NAME,ADDRESS)
VALUES(1,'Nike','One Bowerman Drive, Beaverton, OR 97005');

INSERT INTO tbSupplier(SUPPLIER_ID,COMPANY_NAME,ADDRESS)
VALUES(2,'GoldsGym','Dallas, Texas, SomeStreetOfGreats');

INSERT INTO tbSupplier(SUPPLIER_ID,COMPANY_NAME,ADDRESS)
VALUES(3,'Wilson', 'Chicago Illinois Street 22');

INSERT INTO tbSupplier(SUPPLIER_ID,COMPANY_NAME,ADDRESS)
VALUES(4,'Under Armour','Baltimore, Merilend Street');

INSERT INTO tbProduct(PRODUCT_ID, PRICE_PER_UNIT, AMOUNT_IN_INV,
AMOUNT_REQUESTED, AMOUNT_ORDERED)
VALUES(1, 100.50, 10, 0,0);

INSERT INTO tbProduct(PRODUCT_ID, PRICE_PER_UNIT, AMOUNT_IN_INV,
AMOUNT_REQUESTED, AMOUNT_ORDERED)
VALUES(2, 25, 20, 0,0);

INSERT INTO tbProduct(PRODUCT_ID, PRICE_PER_UNIT, AMOUNT_IN_INV,
AMOUNT_REQUESTED, AMOUNT_ORDERED)
VALUES(3, 34, 15, 0,0);

INSERT INTO tbProduct(PRODUCT_ID, PRICE_PER_UNIT, AMOUNT_IN_INV,
AMOUNT_REQUESTED, AMOUNT_ORDERED)
VALUES(4, 500, 5, 0,0);

INSERT INTO tbProduct(PRODUCT_ID, PRICE_PER_UNIT, AMOUNT_IN_INV,
AMOUNT_REQUESTED, AMOUNT_ORDERED)
VALUES(5, 200, 30, 0,0);

INSERT INTO tbProductSupplier(REL_ID, PRODUCT_ID, SUPPLIER_ID)
VALUES(1, 1, 4);

INSERT INTO tbProductSupplier(REL_ID, PRODUCT_ID, SUPPLIER_ID)
VALUES(2, 5, 2);

INSERT INTO tbProductSupplier(REL_ID, PRODUCT_ID, SUPPLIER_ID)
VALUES(3, 4, 3);

INSERT INTO tbProductSupplier(REL_ID, PRODUCT_ID, SUPPLIER_ID)
VALUES(4, 2, 1);

INSERT INTO tbProductSupplier(REL_ID, PRODUCT_ID, SUPPLIER_ID)
VALUES(5, 3, 1);

/* Num 1*/

SELECT CUSTOMER_ID ,
ADDRESS ,
GENDER ,
CUST_NAME  FROM tbCustomer;

/* Num 2 ORDER BY */

SELECT COMPANY_NAME FROM tbSupplier
ORDER BY COMPANY_NAME ASC;

/* Num 3 Left JOIN + AGGR SUM */
SELECT s.COMPANY_NAME, SUM(pr.PRICE_PER_UNIT*pr.AMOUNT_IN_INV) FROM 
tbSupplier s
LEFT JOIN tbProductSupplier ps ON s.SUPPLIER_ID = ps.SUPPLIER_ID
LEFT JOIN tbProduct pr ON pr.PRODUCT_ID = ps.PRODUCT_ID
GROUP BY(s.COMPANY_NAME);

/* Num 4 LEFT JOIN + AGGR AVG */

SELECT s.COMPANY_NAME, AVG(pr.PRICE_PER_UNIT) FROM 
tbSupplier s
LEFT JOIN tbProductSupplier ps ON s.SUPPLIER_ID = ps.SUPPLIER_ID
LEFT JOIN tbProduct pr ON pr.PRODUCT_ID = ps.PRODUCT_ID
GROUP BY(s.COMPANY_NAME);


/*
CREATE TABLE tbCompletedRequests(
    in_id NUMBER,
    PRIMARY KEY(in_id),
    req_id NUMBER,
    FOREIGN KEY(req_id) REFERENCES tbProductRequests(req_id)
);

CREATE TABLE tbCompletedOrder(
    in_id NUMBER,
    PRIMARY KEY(in_id),
    order_id NUMBER NOT NULL,
    FOREIGN KEY(order_id) REFERENCES tbOrders(order_id)
);
*/