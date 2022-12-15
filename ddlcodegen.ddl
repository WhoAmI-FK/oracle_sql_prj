-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2022-12-15 22:40:18 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE relation_6 (
    tbsport_sport_id       INTEGER NOT NULL,
    tbcustomer_customer_id INTEGER NOT NULL
);

ALTER TABLE relation_6 ADD CONSTRAINT relation_6_pk PRIMARY KEY ( tbsport_sport_id,
                                                                  tbcustomer_customer_id );

CREATE TABLE tbcustomer (
    customer_id INTEGER NOT NULL,
    address     VARCHAR2(255) NOT NULL,
    gender      CHAR(1) NOT NULL,
    cust_name   VARCHAR2(255) NOT NULL
);

ALTER TABLE tbcustomer
    ADD CHECK ( gender IN ( 'F', 'M' ) );

ALTER TABLE tbcustomer ADD CONSTRAINT tbcustomer_pk PRIMARY KEY ( customer_id );

CREATE TABLE tborders (
    order_id                 INTEGER NOT NULL,
    tbproductsupplier_rel_id INTEGER NOT NULL,
    tbcustomer_customer_id   INTEGER NOT NULL
);

ALTER TABLE tborders ADD CONSTRAINT tborders_pk PRIMARY KEY ( order_id );

CREATE TABLE tbproduct (
    product_id       INTEGER NOT NULL,
    price_per_unit   NUMBER(10, 4) DEFAULT 0,
    amount_in_inv    INTEGER DEFAULT 0 NOT NULL,
    amount_requested INTEGER DEFAULT 0 NOT NULL,
    amount_ordered   INTEGER DEFAULT 0 NOT NULL
);

ALTER TABLE tbproduct ADD CHECK ( amount_in_inv = 0 );

ALTER TABLE tbproduct ADD CONSTRAINT tbproduct_pk PRIMARY KEY ( product_id );

CREATE TABLE tbproductsupplier (
    rel_id                 INTEGER NOT NULL,
    tbsupplier_supplier_id INTEGER NOT NULL,
    tbproduct_product_id   INTEGER NOT NULL
);

ALTER TABLE tbproductsupplier ADD CONSTRAINT tbproductsupplier_pk PRIMARY KEY ( rel_id );

CREATE TABLE tbsport (
    sport_id   INTEGER NOT NULL,
    sport_name VARCHAR2(255) NOT NULL
);

ALTER TABLE tbsport ADD CONSTRAINT tbsport_pk PRIMARY KEY ( sport_id );

ALTER TABLE tbsport ADD CONSTRAINT tbsport__un UNIQUE ( sport_name );

CREATE TABLE tbsupplier (
    supplier_id  INTEGER NOT NULL,
    company_name VARCHAR2(255) NOT NULL,
    address      VARCHAR2(255) NOT NULL
);

ALTER TABLE tbsupplier ADD CONSTRAINT tbsupplier_pk PRIMARY KEY ( supplier_id );

ALTER TABLE tbsupplier ADD CONSTRAINT tbsupplier__un UNIQUE ( company_name );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_tbcustomer_fk FOREIGN KEY ( tbcustomer_customer_id )
        REFERENCES tbcustomer ( customer_id );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_tbsport_fk FOREIGN KEY ( tbsport_sport_id )
        REFERENCES tbsport ( sport_id );

ALTER TABLE tborders
    ADD CONSTRAINT tborders_tbcustomer_fk FOREIGN KEY ( tbcustomer_customer_id )
        REFERENCES tbcustomer ( customer_id );

ALTER TABLE tborders
    ADD CONSTRAINT tborders_tbproductsupplier_fk FOREIGN KEY ( tbproductsupplier_rel_id )
        REFERENCES tbproductsupplier ( rel_id );

ALTER TABLE tbproductsupplier
    ADD CONSTRAINT tbproductsupplier_tbproduct_fk FOREIGN KEY ( tbproduct_product_id )
        REFERENCES tbproduct ( product_id );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE tbproductsupplier
    ADD CONSTRAINT tbproductsupplier_tbsupplier_fk FOREIGN KEY ( tbsupplier_supplier_id )
        REFERENCES tbsupplier ( supplier_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0