CREATE TABLE tbSport(
    sport_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    PRIMARY KEY(sport_id),
    sport_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE tbCustomer(
    customer_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    PRIMARY KEY(customer_id),
    address VARCHAR(255) NOT NULL, /* temporary sol, consider another table */
    gender CHAR(1) NOT NULL CHECK (gender = 'M' or gender = 'F'),
    preffered_sport NUMBER,
    FOREIGN KEY(preffered_sport) REFERENCES tbSport(sport_id)
);

CREATE TABLE tbSupplier(
    supplier_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    PRIMARY KEY(supplier_id),
    company_name VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255) /* temporary sol consider another table */
);



CREATE TABLE tbProduct(
    product_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    PRIMARY KEY(product_id),
    price_per_unit NUMBER(10,4) DEFAULT 0,
    amount_in_inv NUMBER DEFAULT 0,
    amount_requested NUMBER DEFAULT 0,
    amount_shipped NUMBER DEFAULT 0
);

CREATE TABLE tbProductSupplier(
    rel_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    PRIMARY KEY(rel_id),
    product_id NUMBER NOT NULL,
    supplier_id NUMBER NOT NULL,
    FOREIGN KEY(product_id) REFERENCES tbProduct(product_id),
    FOREIGN KEY(supplier_id) REFERENCES tbSupplier(supplier_id)
);

CREATE TABLE tbOrders(
    order_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    customer_id NUMBER NOT NULL,
    prod_sup_id NUMBER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES tbCustomer(customer_id),
    FOREIGN KEY(prod_sup_id) REFERENCES tbProductSupplier(rel_id)
);