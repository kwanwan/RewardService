DROP TRIGGER customer_on_insert;
DROP TRIGGER feedback_on_insert;
DROP SEQUENCE customer_seq;
DROP SEQUENCE feedback_seq;
DROP TABLE customer;
DROP TABLE product;
DROP TABLE offers;
DROP TABLE settinz;
DROP TABLE feedback;
CREATE TABLE settinz
( ID NUMBER NOT NULL ENABLE,
  ANNOY VARCHAR2(511),
  MBEID VARCHAR2(511),
  MCSIDDOM VARCHAR2(255),
  APINAME VARCHAR2(255),
  APPKEY VARCHAR2(511),
  SENDERID VARCHAR2(511),
  PRIMARY KEY(ID)
);
INSERT INTO settinz VALUES
 (1,'R1NFMDAwMTE2NzhfTUNTX01PQklMRV9BTk9OWU1PVVNfQVBQSUQ6Smk3cXBld3lrczlfbmI=',
  '2879cc11-97de-485a-bced-8476b91196f3','gse00011679',
  'LoyaltyManagementAPI','9722de7f-4ecf-443f-8e0e-714b2f6e0f9c','925757644219');
CREATE TABLE product
(	"ID"            NUMBER NOT NULL ENABLE
   ,  "PRODUCTNAME"   VARCHAR2(255 BYTE)
   ,  "PRODUCTPRICE"  NUMBER
   ,  "PRODUCTIMAGE"  VARCHAR2(255 BYTE)
   ,  "PRODUCTDESC"   VARCHAR2(255 BYTE)
   ,  CONSTRAINT      "PRODUCT_PK" PRIMARY KEY ("ID")
 );
CREATE TABLE offers
(	"ID"            NUMBER(*,0) NOT NULL ENABLE
   ,  "OFFERNAME"     VARCHAR2(255 BYTE)
   ,  "POINTS"        NUMBER(*,0)
   ,  "MESSAGE"       VARCHAR2(511 BYTE)
   ,  "PRODUCTID"     NUMBER
   ,  PRIMARY KEY ("ID")
);
CREATE TABLE customer
( "ID"            NUMBER NOT NULL ENABLE
    , "CUSTOMERNAME"  VARCHAR2(255 BYTE)
    , "POINTS"        NUMBER(*,0)
    , "COUPONS"       NUMBER(*,0)
    , "UNAME"         VARCHAR2(255 BYTE)
    , "PASSWORD"      VARCHAR2(255 BYTE) DEFAULT 'Oracle123'
    ,                 PRIMARY KEY ("ID")
);
CREATE TABLE FEEDBACK
( "ID" NUMBER NOT NULL
  , "CUSTOMERNAME" VARCHAR2(255)
  , "CUSTOMEREMAIL" VARCHAR2(255)
  , "WHATTYPE" VARCHAR2(255)
  , "FEEDBACK" VARCHAR2(2000)
  , CONSTRAINT FEEDBACK_PK PRIMARY KEY ("ID") ENABLE
);

create sequence customer_seq increment by 1 start with 50001 maxvalue 99999 nocycle;
create sequence feedback_seq increment by 1 start with 10001 maxvalue 99999 nocycle;

Insert into OFFERS (ID,OFFERNAME,POINTS,MESSAGE,PRODUCTID) values (10001,'Our new aroma roast',10000,'Try special brew today and enjoy 10% off with 10,000 points',20001);
Insert into OFFERS (ID,OFFERNAME,POINTS,MESSAGE,PRODUCTID) values (10002,'Fresh brewed everyday',20000,'Purchase special brew between 3-5pm and receive 20% off with 20,000 points',20002);
Insert into OFFERS (ID,OFFERNAME,POINTS,MESSAGE,PRODUCTID) values (10003,'Upgrade your iced coffee',5000,'Stop in today and treat yourself to an upgraded iced coffee with 5,000 points',20003);

Insert into PRODUCT (ID,PRODUCTNAME,PRODUCTPRICE,PRODUCTIMAGE,PRODUCTDESC) values (20001,'Aroma Beans',21,'20001.jpg','Blend of incomparable Balance of sweetness, aroma and body. Composed of 50% Arabica and 50% Robusta.');
Insert into PRODUCT (ID,PRODUCTNAME,PRODUCTPRICE,PRODUCTIMAGE,PRODUCTDESC) values (20002,'Valentine',20,'20002.jpg','Specialty coffee roasted in small batches by people who care. The specialty part means we only choose to roast top-tier, rigorously-graded, traceable coffees.');
Insert into PRODUCT (ID,PRODUCTNAME,PRODUCTPRICE,PRODUCTIMAGE,PRODUCTDESC) values (20003,'Coffee Break',15,'20003.jpg','Celebrates the rich flavor of espresso. It is a simple drink, yet we prepare it with care. Baristas pour two espresso shots, and then quickly pour hot water over the top to produce a light layer of crema.');
Insert into PRODUCT (ID,PRODUCTNAME,PRODUCTPRICE,PRODUCTIMAGE,PRODUCTDESC) values (20004,'Festival Blend',5,'20004.jpg','Tea x Coffee blend combining high quality Uji tea and tasty coffee beans to appear at food festival Taste of Paris');


INSERT into CUSTOMER values (30001,'Lisa Jones',1,6,'lisa.jones','Oracle123');
INSERT into CUSTOMER values (30002,'Bala Gupta',2,10,'bala.gupta','Oracle123');
INSERT into CUSTOMER values (30003,'Roland Dubois',0,2,'roland.dubois','Oracle123');
INSERT into CUSTOMER values (30004,'Joe Blog',0,4,'user@email.com','Oracle123');
INSERT into CUSTOMER values (40000,'Milton Caldwell',0,2,'cloud.admin','Oracle123');
INSERT into CUSTOMER values (40001,'Robert Ellis',1,3,'demo','Oracle123');
INSERT into CUSTOMER values (40002,'Josephine Mendez',2,2,'demo@oracle.com','Oracle123');
INSERT into CUSTOMER values (40003,'Hattie Mason',0,4,'demo@demo.com','Oracle123');
INSERT into CUSTOMER values (40004,'Harry Thornton',1,4,'oracle@oracle.com','Oracle123');
INSERT into CUSTOMER values (40005,'Adeline Flores',2,48,'oracle','Oracle123');
INSERT into CUSTOMER values (40006,'Patrick Rowe',0,13,'weblogic','Oracle123');
INSERT into CUSTOMER values (40007,'Daniel Reese',1,19,'roktizawa@ic.edu','Oracle123');
INSERT into CUSTOMER values (40008,'Tillie Allison',2,4,'bocno@zegwifa.io','Oracle123');
INSERT into CUSTOMER values (40009,'Nettie Ortiz',0,16,'uc@kojpeg.gov','Oracle123');
INSERT into CUSTOMER values (40010,'Joseph Higgins',1,11,'hog@pifu.com','Oracle123');
INSERT into CUSTOMER values (40011,'Jane Luna',2,14,'oz@kazbap.io','Oracle123');
INSERT into CUSTOMER values (40012,'Bettie Snyder',0,0,'zu@ti.com','Oracle123');
INSERT into CUSTOMER values (40013,'Seth Vasquez',1,17,'ja@sevuvku.io','Oracle123');
INSERT into CUSTOMER values (40014,'Millie Reynolds',2,32,'ideapeiv@li.gov','Oracle123');
INSERT into CUSTOMER values (40015,'Steve Schmidt',0,20,'pisgohsu@jat.com','Oracle123');
INSERT into CUSTOMER values (40016,'Phoebe Martin',1,12,'sir@nedku.co.uk','Oracle123');
INSERT into CUSTOMER values (40017,'Thomas Ortiz',2,21,'icwuw@ru.io','Oracle123');
INSERT into CUSTOMER values (40018,'Mabelle Tyler',0,15,'wacsa@vodsa.org','Oracle123');
INSERT into CUSTOMER values (40019,'Brian Sutton',1,13,'agsu@ineloh.edu','Oracle123');
INSERT into CUSTOMER values (40020,'May Manning',2,17,'awomo@iwo.io','Oracle123');
INSERT into CUSTOMER values (40021,'Alvin Hanson',0,5,'wi@mugvevcal.edu','Oracle123');
INSERT into CUSTOMER values (40022,'Christine Sanders',1,20,'faczug@ufolobi.edu','Oracle123');
INSERT into CUSTOMER values (40023,'Minerva Graham',2,26,'tezam@guf.net','Oracle123');
INSERT into CUSTOMER values (40024,'Lilly Dixon',0,39,'fufe@wutonhuf.org','Oracle123');
INSERT into CUSTOMER values (40025,'Richard Peters',1,13,'hanevo@fu.edu','Oracle123');
INSERT into CUSTOMER values (40026,'Henrietta Carson',2,28,'becwoppa@mina.io','Oracle123');
INSERT into CUSTOMER values (40027,'Sean Oliver',0,30,'big@sud.net','Oracle123');
INSERT into CUSTOMER values (40028,'Emilie McGuire',1,38,'omen@as.org','Oracle123');
INSERT into CUSTOMER values (40029,'Edna Bishop',2,46,'meuc@vocme.edu','Oracle123');
INSERT into CUSTOMER values (40030,'Pearl Morgan',0,9,'ofafe@vane.net','Oracle123');
INSERT into CUSTOMER values (40031,'Johnny Murphy',1,30,'wimesle@jis.co.uk','Oracle123');
INSERT into CUSTOMER values (40032,'Dollie Lawrence',2,2,'dutma@heuj.org','Oracle123');
INSERT into CUSTOMER values (40033,'Theodore Tucker',0,1,'piz@jeka.io','Oracle123');
INSERT into CUSTOMER values (40034,'Lora Rose',1,30,'tedlem@tepteato.org','Oracle123');
INSERT into CUSTOMER values (40035,'Lois Wright',2,4,'aca@vudembed.co.uk','Oracle123');
INSERT into CUSTOMER values (40036,'Elijah McKinney',0,8,'zinbeir@negjolek.gov','Oracle123');
INSERT into CUSTOMER values (40037,'Michael Thomas',1,4,'tamipup@kajho.co.uk','Oracle123');
INSERT into CUSTOMER values (40038,'Rosalie Jenkins',2,5,'dod@hethiimi.org','Oracle123');
INSERT into CUSTOMER values (40039,'Theresa Moran',0,1,'ma@zamego.edu','Oracle123');
INSERT into CUSTOMER values (40040,'Gertrude Stone',1,0,'unigakwi@pu.co.uk','Oracle123');
INSERT into CUSTOMER values (40041,'Mae Pearson',2,0,'tisniha@nadlit.edu','Oracle123');
INSERT into CUSTOMER values (40042,'Belle Curry',0,4,'iroitacet@hizholpo.gov','Oracle123');
INSERT into CUSTOMER values (40043,'Stella Weaver',1,3,'owifofwow@etocu.com','Oracle123');
INSERT into CUSTOMER values (40044,'Thomas Carson',2,0,'ob@awugol.gov','Oracle123');
INSERT into CUSTOMER values (40045,'Jim Francis',0,3,'bafi@jowiw.co.uk','Oracle123');
INSERT into CUSTOMER values (40046,'Sara Delgado',1,5,'ijpes@kad.net','Oracle123');
INSERT into CUSTOMER values (40047,'Hunter Stephens',2,0,'dabes@efubi.co.uk','Oracle123');
INSERT into CUSTOMER values (40048,'Harvey Reeves',0,1,'zu@saju.com','Oracle123');
INSERT into CUSTOMER values (40049,'Paul Vega',1,3,'tavezvi@aluole.edu','Oracle123');
INSERT into CUSTOMER values (40050,'Todd Warner',2,5,'pijekafah@johpoaje.edu','Oracle123');

COMMIT;

CREATE or REPLACE TRIGGER customer_on_insert
  BEFORE INSERT ON customer
  FOR EACH ROW
BEGIN
  SELECT customer_seq.nextval
  INTO :new.ID
  FROM DUAL;
END;

CREATE or REPLACE TRIGGER feedback_on_insert
  BEFORE INSERT ON feedback
  FOR EACH ROW
BEGIN
  SELECT feedback_seq.nextval
  INTO :new.ID
  FROM DUAL;
END;
