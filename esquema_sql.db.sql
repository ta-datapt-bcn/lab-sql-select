BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "authors" (
	"au_id"	varchar(11) NOT NULL,
	"au_lname"	varchar(40) NOT NULL,
	"au_fname"	varchar(20) NOT NULL,
	"phone"	char(12) NOT NULL,
	"address"	varchar(40) DEFAULT NULL,
	"city"	varchar(20) DEFAULT NULL,
	"state"	char(2) DEFAULT NULL,
	"zip"	char(5) DEFAULT NULL,
	"contract"	integer NOT NULL,
	PRIMARY KEY("au_id")
);
CREATE TABLE IF NOT EXISTS "discounts" (
	"discounttype"	varchar(40) NOT NULL,
	"stor_id"	char(4) DEFAULT NULL,
	"lowqty"	integer DEFAULT NULL,
	"highqty"	integer DEFAULT NULL,
	"discount"	decimal(4, 2) NOT NULL,
	CONSTRAINT "discounts_ibfk_1" FOREIGN KEY("stor_id") REFERENCES "stores"("stor_id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS "employee" (
	"emp_id"	char(9) NOT NULL,
	"fname"	varchar(20) NOT NULL,
	"minit"	char(1) DEFAULT NULL,
	"lname"	varchar(30) NOT NULL,
	"job_id"	integer NOT NULL,
	"job_lvl"	integer DEFAULT NULL,
	"pub_id"	char(4) NOT NULL,
	"hire_date"	datetime NOT NULL,
	CONSTRAINT "employee_ibfk_1" FOREIGN KEY("job_id") REFERENCES "jobs"("job_id") ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "employee_ibfk_2" FOREIGN KEY("pub_id") REFERENCES "publishers"("pub_id") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("emp_id")
);
CREATE TABLE IF NOT EXISTS "jobs" (
	"job_id"	integer NOT NULL,
	"job_desc"	varchar(50) NOT NULL,
	"min_lvl"	integer NOT NULL,
	"max_lvl"	integer NOT NULL,
	PRIMARY KEY("job_id")
);
CREATE TABLE IF NOT EXISTS "pub_info" (
	"pub_id"	char(4) NOT NULL,
	"logo"	longblob DEFAULT NULL,
	"pr_info"	longtext DEFAULT NULL,
	CONSTRAINT "pub_info_ibfk_1" FOREIGN KEY("pub_id") REFERENCES "publishers"("pub_id") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("pub_id")
);
CREATE TABLE IF NOT EXISTS "publishers" (
	"pub_id"	char(4) NOT NULL,
	"pub_name"	varchar(40) DEFAULT NULL,
	"city"	varchar(20) DEFAULT NULL,
	"state"	char(2) DEFAULT NULL,
	"country"	varchar(30) DEFAULT NULL,
	PRIMARY KEY("pub_id")
);
CREATE TABLE IF NOT EXISTS "roysched" (
	"title_id"	varchar(6) NOT NULL,
	"lorange"	integer DEFAULT NULL,
	"hirange"	integer DEFAULT NULL,
	"royalty"	integer DEFAULT NULL,
	CONSTRAINT "roysched_ibfk_1" FOREIGN KEY("title_id") REFERENCES "titles"("title_id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS "sales" (
	"stor_id"	char(4) NOT NULL,
	"ord_num"	varchar(20) NOT NULL,
	"ord_date"	datetime NOT NULL,
	"qty"	integer NOT NULL,
	"payterms"	varchar(12) NOT NULL,
	"title_id"	varchar(6) NOT NULL,
	CONSTRAINT "sales_ibfk_1" FOREIGN KEY("stor_id") REFERENCES "stores"("stor_id") ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "sales_ibfk_2" FOREIGN KEY("title_id") REFERENCES "titles"("title_id") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("stor_id","ord_num","title_id")
);
CREATE TABLE IF NOT EXISTS "stores" (
	"stor_id"	char(4) NOT NULL,
	"stor_name"	varchar(40) DEFAULT NULL,
	"stor_address"	varchar(40) DEFAULT NULL,
	"city"	varchar(20) DEFAULT NULL,
	"state"	char(2) DEFAULT NULL,
	"zip"	char(5) DEFAULT NULL,
	PRIMARY KEY("stor_id")
);
CREATE TABLE IF NOT EXISTS "titleauthor" (
	"au_id"	varchar(11) NOT NULL,
	"title_id"	varchar(6) NOT NULL,
	"au_ord"	integer DEFAULT NULL,
	"royaltyper"	integer DEFAULT NULL,
	CONSTRAINT "titleauthor_ibfk_1" FOREIGN KEY("title_id") REFERENCES "titles"("title_id") ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "titleauthor_ibfk_2" FOREIGN KEY("au_id") REFERENCES "authors"("au_id") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("au_id","title_id")
);
CREATE TABLE IF NOT EXISTS "titles" (
	"title_id"	varchar(6) NOT NULL,
	"title"	varchar(80) NOT NULL,
	"type"	char(12) NOT NULL,
	"pub_id"	char(4) DEFAULT NULL,
	"price"	decimal(19, 4) DEFAULT NULL,
	"advance"	decimal(19, 4) DEFAULT NULL,
	"royalty"	integer DEFAULT NULL,
	"ytd_sales"	integer DEFAULT NULL,
	"notes"	varchar(200) DEFAULT NULL,
	"pubdate"	datetime NOT NULL,
	CONSTRAINT "titles_ibfk_1" FOREIGN KEY("pub_id") REFERENCES "publishers"("pub_id") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("title_id")
);
INSERT INTO "authors" VALUES ('172-32-1176','White','Johnson','408 496-7223','10932 Bigge Rd.','Menlo Park','CA','94025',1);
INSERT INTO "authors" VALUES ('213-46-8915','Green','Marjorie','415 986-7020','309 63rd St. #411','Oakland','CA','94618',1);
INSERT INTO "authors" VALUES ('238-95-7766','Carson','Cheryl','415 548-7723','589 Darwin Ln.','Berkeley','CA','94705',1);
INSERT INTO "authors" VALUES ('267-41-2394','O''Leary','Michael','408 286-2428','22 Cleveland Av. #14','San Jose','CA','95128',1);
INSERT INTO "authors" VALUES ('274-80-9391','Straight','Dean','415 834-2919','5420 College Av.','Oakland','CA','94609',1);
INSERT INTO "authors" VALUES ('341-22-1782','Smith','Meander','913 843-0462','10 Mississippi Dr.','Lawrence','KS','66044',0);
INSERT INTO "authors" VALUES ('409-56-7008','Bennet','Abraham','415 658-9932','6223 Bateman St.','Berkeley','CA','94705',1);
INSERT INTO "authors" VALUES ('427-17-2319','Dull','Ann','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',1);
INSERT INTO "authors" VALUES ('472-27-2349','Gringlesby','Burt','707 938-6445','PO Box 792','Covelo','CA','95428',1);
INSERT INTO "authors" VALUES ('486-29-1786','Locksley','Charlene','415 585-4620','18 Broadway Av.','San Francisco','CA','94130',1);
INSERT INTO "authors" VALUES ('527-72-3246','Greene','Morningstar','615 297-2723','22 Graybar House Rd.','Nashville','TN','37215',0);
INSERT INTO "authors" VALUES ('648-92-1872','Blotchet-Halls','Reginald','503 745-6402','55 Hillsdale Bl.','Corvallis','OR','97330',1);
INSERT INTO "authors" VALUES ('672-71-3249','Yokomoto','Akiko','415 935-4228','3 Silver Ct.','Walnut Creek','CA','94595',1);
INSERT INTO "authors" VALUES ('712-45-1867','del Castillo','Innes','615 996-8275','2286 Cram Pl. #86','Ann Arbor','MI','48105',1);
INSERT INTO "authors" VALUES ('722-51-5454','DeFrance','Michel','219 547-9982','3 Balding Pl.','Gary','IN','46403',1);
INSERT INTO "authors" VALUES ('724-08-9931','Stringer','Dirk','415 843-2991','5420 Telegraph Av.','Oakland','CA','94609',0);
INSERT INTO "authors" VALUES ('724-80-9391','MacFeather','Stearns','415 354-7128','44 Upland Hts.','Oakland','CA','94612',1);
INSERT INTO "authors" VALUES ('756-30-7391','Karsen','Livia','415 534-9219','5720 McAuley St.','Oakland','CA','94609',1);
INSERT INTO "authors" VALUES ('807-91-6654','Panteley','Sylvia','301 946-8853','1956 Arlington Pl.','Rockville','MD','20853',1);
INSERT INTO "authors" VALUES ('846-92-7186','Hunter','Sheryl','415 836-7128','3410 Blonde St.','Palo Alto','CA','94301',1);
INSERT INTO "authors" VALUES ('893-72-1158','McBadden','Heather','707 448-4982','301 Putnam','Vacaville','CA','95688',0);
INSERT INTO "authors" VALUES ('899-46-2035','Ringer','Anne','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152',1);
INSERT INTO "authors" VALUES ('998-72-3567','Ringer','Albert','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84152',1);
INSERT INTO "discounts" VALUES ('Initial Customer',NULL,NULL,NULL,10.5);
INSERT INTO "discounts" VALUES ('Volume Discount',NULL,100,1000,6.7);
INSERT INTO "discounts" VALUES ('Customer Discount','8042',NULL,NULL,5);
INSERT INTO "employee" VALUES ('A-C71970F','Aria','','Cruz',10,87,'1389','1991-10-26 00:00:00');
INSERT INTO "employee" VALUES ('A-R89858F','Annette','','Roulet',6,152,'9999','1990-02-21 00:00:00');
INSERT INTO "employee" VALUES ('AMD15433F','Ann','M','Devon',3,200,'9952','1991-07-16 00:00:00');
INSERT INTO "employee" VALUES ('ARD36773F','Anabela','R','Domingues',8,100,'0877','1993-01-27 00:00:00');
INSERT INTO "employee" VALUES ('CFH28514M','Carlos','F','Hernadez',5,211,'9999','1989-04-21 00:00:00');
INSERT INTO "employee" VALUES ('CGS88322F','Carine','G','Schmitt',13,64,'1389','1992-07-07 00:00:00');
INSERT INTO "employee" VALUES ('DBT39435M','Daniel','B','Tonini',11,75,'0877','1990-01-01 00:00:00');
INSERT INTO "employee" VALUES ('DWR65030M','Diego','W','Roel',6,192,'1389','1991-12-16 00:00:00');
INSERT INTO "employee" VALUES ('ENL44273F','Elizabeth','N','Lincoln',14,35,'0877','1990-07-24 00:00:00');
INSERT INTO "employee" VALUES ('F-C16315M','Francisco','','Chang',4,227,'9952','1990-11-03 00:00:00');
INSERT INTO "employee" VALUES ('GHT50241M','Gary','H','Thomas',9,170,'0736','1988-08-09 00:00:00');
INSERT INTO "employee" VALUES ('H-B39728F','Helen','','Bennett',12,35,'0877','1989-09-21 00:00:00');
INSERT INTO "employee" VALUES ('HAN90777M','Helvetius','A','Nagy',7,120,'9999','1993-03-19 00:00:00');
INSERT INTO "employee" VALUES ('HAS54740M','Howard','A','Snyder',12,100,'0736','1988-11-19 00:00:00');
INSERT INTO "employee" VALUES ('JYL26161F','Janine','Y','Labrune',5,172,'9901','1991-05-26 00:00:00');
INSERT INTO "employee" VALUES ('KFJ64308F','Karin','F','Josephs',14,100,'0736','1992-10-17 00:00:00');
INSERT INTO "employee" VALUES ('KJJ92907F','Karla','J','Jablonski',9,170,'9999','1994-03-11 00:00:00');
INSERT INTO "employee" VALUES ('L-B31947F','Lesley','','Brown',7,120,'0877','1991-02-13 00:00:00');
INSERT INTO "employee" VALUES ('LAL21447M','Laurence','A','Lebihan',5,175,'0736','1990-06-03 00:00:00');
INSERT INTO "employee" VALUES ('M-L67958F','Maria','','Larsson',7,135,'1389','1992-03-27 00:00:00');
INSERT INTO "employee" VALUES ('M-P91209M','Manuel','','Pereira',8,101,'9999','1989-01-09 00:00:00');
INSERT INTO "employee" VALUES ('M-R38834F','Martine','','Rance',9,75,'0877','1992-02-05 00:00:00');
INSERT INTO "employee" VALUES ('MAP77183M','Miguel','A','Paolino',11,112,'1389','1992-12-07 00:00:00');
INSERT INTO "employee" VALUES ('MAS70474F','Margaret','A','Smith',9,78,'1389','1988-09-29 00:00:00');
INSERT INTO "employee" VALUES ('MFS52347M','Martin','F','Sommer',10,165,'0736','1990-04-13 00:00:00');
INSERT INTO "employee" VALUES ('MGK44605M','Matti','G','Karttunen',6,220,'0736','1994-05-01 00:00:00');
INSERT INTO "employee" VALUES ('MJP25939M','Maria','J','Pontes',5,246,'1756','1989-03-01 00:00:00');
INSERT INTO "employee" VALUES ('MMS49649F','Mary','M','Saveley',8,175,'0736','1993-06-29 00:00:00');
INSERT INTO "employee" VALUES ('PCM98509F','Patricia','C','McKenna',11,150,'9999','1989-08-01 00:00:00');
INSERT INTO "employee" VALUES ('PDI47470M','Palle','D','Ibsen',7,195,'0736','1993-05-09 00:00:00');
INSERT INTO "employee" VALUES ('PHF38899M','Peter','H','Franken',10,75,'0877','1992-05-17 00:00:00');
INSERT INTO "employee" VALUES ('PMA42628M','Paolo','M','Accorti',13,35,'0877','1992-08-27 00:00:00');
INSERT INTO "employee" VALUES ('POK93028M','Pirkko','O','Koskitalo',10,80,'9999','1993-11-29 00:00:00');
INSERT INTO "employee" VALUES ('PSA89086M','Pedro','S','Afonso',14,89,'1389','1990-12-24 00:00:00');
INSERT INTO "employee" VALUES ('PSP68661F','Paula','S','Parente',8,125,'1389','1994-01-19 00:00:00');
INSERT INTO "employee" VALUES ('PTC11962M','Philip','T','Cramer',2,215,'9952','1989-11-11 00:00:00');
INSERT INTO "employee" VALUES ('PXH22250M','Paul','X','Henriot',5,159,'0877','1993-08-19 00:00:00');
INSERT INTO "employee" VALUES ('R-M53550M','Roland','','Mendel',11,150,'0736','1991-09-05 00:00:00');
INSERT INTO "employee" VALUES ('RBM23061F','Rita','B','Muller',5,198,'1622','1993-10-09 00:00:00');
INSERT INTO "employee" VALUES ('SKO22412M','Sven','K','Ottlieb',5,150,'1389','1991-04-05 00:00:00');
INSERT INTO "employee" VALUES ('TPO55093M','Timothy','P','O''Rourke',13,100,'0736','1988-06-19 00:00:00');
INSERT INTO "employee" VALUES ('VPA30890F','Victoria','P','Ashworth',6,140,'0877','1990-09-13 00:00:00');
INSERT INTO "employee" VALUES ('Y-L77953M','Yoshi','','Latimer',12,32,'1389','1989-06-11 00:00:00');
INSERT INTO "jobs" VALUES (1,'New Hire - Job not specified',10,10);
INSERT INTO "jobs" VALUES (2,'Chief Executive Officer',200,250);
INSERT INTO "jobs" VALUES (3,'Business Operations Manager',175,225);
INSERT INTO "jobs" VALUES (4,'Chief Financial Officier',175,250);
INSERT INTO "jobs" VALUES (5,'Publisher',150,250);
INSERT INTO "jobs" VALUES (6,'Managing Editor',140,225);
INSERT INTO "jobs" VALUES (7,'Marketing Manager',120,200);
INSERT INTO "jobs" VALUES (8,'Public Relations Manager',100,175);
INSERT INTO "jobs" VALUES (9,'Acquisitions Manager',75,175);
INSERT INTO "jobs" VALUES (10,'Productions Manager',75,165);
INSERT INTO "jobs" VALUES (11,'Operations Manager',75,150);
INSERT INTO "jobs" VALUES (12,'Editor',25,100);
INSERT INTO "jobs" VALUES (13,'Sales Representative',25,100);
INSERT INTO "jobs" VALUES (14,'Designer',25,100);
INSERT INTO "pub_info" VALUES ('0736','GIF89a\�\0\0�\0\0\0\0�\0\0\0�\0��\0\0\0��\0�\0���������\0\0\0�\0��\0\0\0��\0�\0�����!�\0\0\0,\0\0\0\0\�\0\0@��\�I��8\�ͻ�`(�$Phg�#j��;ŰU��Cӹ�\��S*6�%;\��#\Z�L���\�֛�*�F\�6\�$7�6�Qj\��0J��
5c\�\�L��$7{]i~dQ3=�!u����vexw�rYu^T�� �y����m�J�����E��wsb��X^lj��B�U���q�����\�\�\�-\�Ȯ\�\�\�\�БC�n�\�ټ,A\�jҏ�\�P�ک�\�%��߁\�_ཱུ�\��\�v\��\�x\�k��l�Ţd�T�j�\��xd\�9.:�X+��\��}�D��H\�\�v{�2��\�`;9I
D''\�!�3
m��fM8?�Y2H��m7��IHѣH�zRʴ�\�xN�\��JUE\�K\�h���h\�RnЦ��3\�Z\�\�Ӑ\�\�=��J:\�
�Zݭ�P��)n>�\�j|ګ\�k$`�M9�QZ��_\Z�� ��#�̹�宼6�!\�\�f\��_G�-�\��J{|h�$�s\�s2/N���\�M�e�\�rK�W�5�\�K�q�\�d�u\Z&�9\�\�\�<7����]\�ؤDwSpI�.�%<\�8\�s�\�\�zH�)y��o��,�\�y\�X0@1�J�\�%\�C����s��W_Y<�[&rU\�]JE�[�\Z6\�aTg�h�\0\0;','This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.');
INSERT INTO "pub_info" VALUES ('0877','GIF89a�\0/\0�\0\0\0\0�\0\0\0�\0��\0\0\0��\0�\0���������\0\0\0�\0��\0\0\0��\0�\0�����!�\0\0\0,\0\0\0\0�\0/\0@��\�I��8\�ͻ���d�ㄦ+Ֆ0�\����(~�y\�s�\�jH,\Z�ȤrI�\�v�0X\�A5W��E=�WhV�jU]4:m?\�\�*7~fۥ�\�\��\�\��*�[F:G��i�z=||�>����fjueg�nlQ�v�dn}���"���$���6Ls~�^���������dp��X\��\�e\�\�6Ρ��\��Ъ\�\�L�\�\�o\�߫_C��ܵ�[����\�\�ٿTa�}���tu\��p\�ŋ��Y�t��\�7�\�p\�U�H�\ŋN Κv.b�Xʸh9��$���Fb�\�e>�+�y$��&F�''�\��ƭ%8�.o�\�)rNcG)%\Z3�ҍ�zZs\Zs%\�mP�jݪ$cկ����O��fV�!�1\�Ŀ�˨y\�єԵ5\�\�۩2!\�"m.�7؜YC�2�ߥł#n�19�%c\�\�m*͋+˒�\�\�\�ƥ>㛧W�b�)I\�G05\��\�?�;���\�`��\0\0;','This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.

This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.

This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.

This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.

This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.');
INSERT INTO "pub_info" VALUES ('1389','GIF89a\�\0\0�\0\0\0\0�\0\0\0�\0��\0\0\0��\0�\0���������\0\0\0�\0��\0\0\0��\0�\0�����!�\0\0\0,\0\0\0\0\�\0\0@��\�I��8\�ͻ�`(�`�(@�,��m,ϳ9\�,\���漟\�&\�A:��\�k��ǡT\�|D�Ǩ\�z/\�/\�%�)\�\�y�U�\�\�1\�5Ϥ�aq����QTeAhL���qQS��X���`E�t�u{l����������������Zj>d�#��\Zw[uf�]���QP�{���}�\��y������ϯoD�Эq\�\�\�S�\�\�\�\�\�\�ہ�ؕ�����\�\�\�����������v\�����t�ܴ�]�|\�TaB=I2k��!�%z�(ga�%�.\�h�$+j''EV\�!ҏ�l\��dŲ�0�!��\�\�\�\�,p�92\�\�\QsF��\�h3h4�I��9\�8�R�Z����j�Z�\�\\�G�Yq@S�LIU�K�V�����.�#s\�%�R#������X\�N\0\0;','This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.');
INSERT INTO "pub_info" VALUES ('1622','GIF89a�\04\0�\0\0\0\0�\0\0\0�\0��\0\0\0��\0�\0���������\0\0\0�\0��\0\0\0��\0�\0�����!�\0\0\0,\0\0\0\0�\04\0@��\�I��8\�ͻ�`(�d\�f�l뾰*\�tmg\�-¬\����)��''\�!\�%i��B#�>�\�Ss��Ay\�kWL&c{\������\�,\�\�''1�y���\�a��i_nlz�mb�j�zy��~1RMp�r���V���Dw|eu�c���}�L�3K��Q���:�������\�Q�\�K\�\�\�\�\�Ŀ\�\�\�\�5�\�k.;��U�ۏi!޸Ԋ���`F\�\�܂���阈x٪\���u�m\��\��\�C��\�1u��)\Hb_;�#J\�Y�\�u1�ǉ��Y�HcH �J���.���>�Y��=|oˇ\��u6\�\�<E��P��|\�L\�e�%M�H�R�\�<$P�b�\�O�\�X��˷��*Sd�\��D�''R@�`��9^�<-�.R�����	V\�pY�v\�>t��ļr�k���ޣ����\�q\�Ui\�~%�X\�\�W.W�\�Y��
��V\�6Vs	g�s{t���\�ڿ�\��\�\�\�/14^3���Ƙ�}N�w��ԳטZ�w\�ɰ>�q�\�\�V똾�uY0o\�,i�\�t���ݤ�S��� \��}F=S���\�NE�|t-X\�{)�TT�8 cQ5�\�8\�\��a/�m�ل�=( �}��#�\�a\�}\���\�.1�\�hV\�\�H}�\�\�\�@\Z\�D��t\�~�i5��訇��(\��69�P���^1]�y%\,j�������[�\�fi3Y�ʉ���Y�v�\�`{nA�W��jR�\�f6\��Q�^ڇCh�ڝS�\�g��V�b�\�x��&Nb�N%�I��TiiX@��''c�\�\�Nw�U:���\h\��}*y���3)�oyi���h�\��l?�8\�؜��5\��E�-i\�\�hG%�Fôuמp��z�t枋��\��.�\�:���6[ﾃ�\�o5\0\0;','This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.');
INSERT INTO "pub_info" VALUES ('1756','GIF89a\�\0%\0�\0\0\0\0�\0\0\0�\0��\0\0\0��\0�\0���������\0\0\0�\0��\0\0\0��\0�\0�����!�\0\0\0,\0\0\0\0\�\0%\0@��\�I��8\�ͻ�`(�$X\��\�\�Nn\�2M\�\��ۺ�ᬇ�竽�GdR\�c6�/(��:Y[@M�x4\�z_\�7�\�Q}N�N\��f6\Z^�\�\�ܥ�T���-B0����������T�{������~��}������|�o���Z{"��7�����@����Srz��Nvgj7���*VMk�wnc[\�m\�\�\�\�sqhy\�tl`S\�v\�ڳ�3\�ղ����\�\�\�o�\�5���\�(\����i��\�>cM�+�\�@}\�咘��ŋ3z�荣F�\��\�i!���/_"q�R-\�G�ΰ�\��\�\�*�/���HKn\�vtJ\�c�yBKN\�6''�M8R��&gC�Q8\� �\�m\�m\��dM\�Q\�πK\�2B\ZV-��_%�\��V�{�6\�\�*J=Gi�\�w��x��\Z.����\�\�e''Yr#đu���\�\�ğo�Q�\�t�>\�\�kp�b��Xs\�\�Y6\�~�C\�&;�\�\�9O5�\�p�퍦�\0���\�/�C�}\�r���ْN��\ZeVk��Q|\�X۷w�x4�unl�\��^T)�<\������i(`G�TJ�Ǘ�\�QW\�\�\�_~���\�\^�gN[��e��E�\�-^�\��Qeh�]�%_c^�E\�R>�y��Š�\�R\��L%Wx\��Ģ�̴\�MA\�͑<Ved�\�\�\�\��q�tU<�\�$W<6i#|XU�\�-\Z\���RHe�V̓D]''\��օ\�X1t�Ԕ�>���%|�\��
�\�\�U�4�j�\��\�d�1�Rb�\���]�Hz�y�\j�\�\�lʝ�O��V�ؤ\�=�jY�\�TP�
�J�m�\���<��vЫ�\�
���bF«���C\�"��X��\Z�Ѿ6m�ɮ�ܤ��Fk���\��F�z\�@���۲\��r\�n\�f\�mqv�[+\�\�[����\�:�
����&<�����\�G,1
\0\0;','This is sample text data for Ramona Publishers, publisher 1756 in the pubs database. Ramona Publishers is located in Dallas, Texas.');
INSERT INTO "pub_info" VALUES ('9901','GIF89a]\0"\0�\0\0\0\0�\0\0\0�\0��\0\0\0��\0�\0���������\0\0\0�\0��\0\0\0��\0�\0�����!�\0\0\0,\0\0\0\0]\0"\0@��\�I��8\�\��\��$�����h��n
\�b:�\�\��]����6k\�x,S2V:�BE�tJ�Z�M"v\�\�^�\�&\�(�0\�8�\�''!׌\�w%&t��a��\��\�^���`J����s����U�ol,�9/k�0p�lTwg7X��^�b~�uN6���u��h����{�he�sO���}�v�[�g\�\�Cy\�\�Ξ\�֧\�\�ڤ\�ǓAȹ\�_�R�޺���v{�ո��>��pk\�\��Z�\�\�\�H�\��%�bS��c�[5�\�ԕ\�\�%\�>�Ӈ	ם�9;\�
R�\��pJ�\�\�.X<��,-rS\�Ȓ&�\�L��S�m@AuJ\�g\�EH�*st�ӧ�\0D\0\0;','This is sample text data for GGG&G, publisher 9901 in the pubs database. GGG&G is located in München, Germany.');
INSERT INTO "pub_info" VALUES ('9952','GIF89a(\0�\0\0\0\0�\0\0\0�\0��\0\0\0��\0�\0���������\0\0\0�\0��\0\0\0��\0�\0�����!�\0\0\0,\0\0\0\0(\0@��\�I��8\�ͻ�`(�dif\0�,{�m�\�LO3�?v_\��8$��\�ѥRڊ̥Qz{Ro''Yi*�\����W\�\�wk\�\�R\�''�G�\�\�\�+<?��\�Y��}v�������������s8�����������t������E�X>i�?S�Lb�^m�;k=��n�d�e�k������(�\�\��\�ǻ�ec|z�{��\�\�ڋ|1\�\�؎/���\�\��\�����\�������������]lҌd\�M�:��\�z��\��՜\�B��\��*Þ\�\�(�\�0���&.�rmY# O.	���,���$��ď\�\�\�82\��g\Z-�sqg(\Z�3!��H\�aI�<��\�	\�NZ�ހ�s\�Qkr|\�Z\��"�s\�ҒU\�v�۶\�T����]�sC���Wnݿ|�
\��W\�]N�+����\�\�I K���0\�˘M\��9�\�̈\�<�ى\�"4\�Ӧr��PUă\�
t*\�fO5c�A}Z�R߱Q*\�]�\�\�f*G��r��\�A?�T�u�\�\�H��4j\�\�T��\�9��\�\��k\�}+}�\�ň.W߽\��j\�m�߸�\�k\�\��\�\�\�M-�WQ�<YVV~�G�A\��a�\�W!�V\��\�W�\�\���^�&�� {6�o\� 2NX!�!Qx\�gcQ��h\�\�\�\� }\��{kqs���''#�4�ENC�a\�ӈ��D\�2G>y\�:Rv3#%a\��e6fV��\�u��o\Z
�u\�\�\��t\�ם��\��y\�g)q)؏��\Z:�>��#\�^�\�蜉"饄���~2i��F�i���	@\0;','This is sample text data for Scootney Books, publisher 9952 in the pubs database. Scootney Books is located in New York City, New York.');
INSERT INTO "pub_info" VALUES ('9999','GIF89a�\0$\0�\0\0\0\0�\0\0\0�\0��\0\0\0��\0�\0���������\0\0\0�\0��\0\0\0��\0�\0�����!�\0\0\0,\0\0\0\0�\0$\0@��\�I��8\�ͻ�`�\Z`�ge>�Ԋp,\��Efh�\�|\��#Վu��DJn�ko\�\�J\�$!��\��YMa���\��bq�h�z\�\�8�%t��n\�ＢM>�\���=zrF�1snIJ�\���3�K�nY�e~J��_}�{V�`d�����c`:.q|���� ���RYGQ����]u���ſ�|\�\�\�f8�*\�@��\�>��\��\�Ω�{#��\�p�b�����箄\�z_��P/C�]t\��g�bE��\�\�As\��1Z\�H[B���9\�F�bAs��Y\�(	YF#\�\�8�T\��՜d#S\���\�1�0\�a\�\�\�˘1\�\��,$N�:?�\�!(,�H���%3iR��։䉰\�D�$;f͇u��\Z��
k-�N7Aֻ��+��\��ѣ�\�\�\t`\�z�\�\�Vמ�����\�\�W�q\�\�eu�0]Q��^Z%6\�8�\�
���S]`r�\�-�X�\�̥���w��<��\�1�J�\Z\�}�Rc�B�7�~B��\�\�T�qd�+� \0;','This is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.

This is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.

This is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.

This is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.');
INSERT INTO "publishers" VALUES ('0736','New Moon Books','Boston','MA','USA');
INSERT INTO "publishers" VALUES ('0877','Binnet & Hardley','Washington','DC','USA');
INSERT INTO "publishers" VALUES ('1389','Algodata Infosystems','Berkeley','CA','USA');
INSERT INTO "publishers" VALUES ('1622','Five Lakes Publishing','Chicago','IL','USA');
INSERT INTO "publishers" VALUES ('1756','Ramona Publishers','Dallas','TX','USA');
INSERT INTO "publishers" VALUES ('9901','GGG&G','Mnchen',NULL,'Germany');
INSERT INTO "publishers" VALUES ('9952','Scootney Books','New York','NY','USA');
INSERT INTO "publishers" VALUES ('9999','Lucerne Publishing','Paris',NULL,'France');
INSERT INTO "roysched" VALUES ('BU1032',0,5000,10);
INSERT INTO "roysched" VALUES ('BU1032',5001,50000,12);
INSERT INTO "roysched" VALUES ('PC1035',0,2000,10);
INSERT INTO "roysched" VALUES ('PC1035',2001,3000,12);
INSERT INTO "roysched" VALUES ('PC1035',3001,4000,14);
INSERT INTO "roysched" VALUES ('PC1035',4001,10000,16);
INSERT INTO "roysched" VALUES ('PC1035',10001,50000,18);
INSERT INTO "roysched" VALUES ('BU2075',0,1000,10);
INSERT INTO "roysched" VALUES ('BU2075',1001,3000,12);
INSERT INTO "roysched" VALUES ('BU2075',3001,5000,14);
INSERT INTO "roysched" VALUES ('BU2075',5001,7000,16);
INSERT INTO "roysched" VALUES ('BU2075',7001,10000,18);
INSERT INTO "roysched" VALUES ('BU2075',10001,12000,20);
INSERT INTO "roysched" VALUES ('BU2075',12001,14000,22);
INSERT INTO "roysched" VALUES ('BU2075',14001,50000,24);
INSERT INTO "roysched" VALUES ('PS2091',0,1000,10);
INSERT INTO "roysched" VALUES ('PS2091',1001,5000,12);
INSERT INTO "roysched" VALUES ('PS2091',5001,10000,14);
INSERT INTO "roysched" VALUES ('PS2091',10001,50000,16);
INSERT INTO "roysched" VALUES ('PS2106',0,2000,10);
INSERT INTO "roysched" VALUES ('PS2106',2001,5000,12);
INSERT INTO "roysched" VALUES ('PS2106',5001,10000,14);
INSERT INTO "roysched" VALUES ('PS2106',10001,50000,16);
INSERT INTO "roysched" VALUES ('MC3021',0,1000,10);
INSERT INTO "roysched" VALUES ('MC3021',1001,2000,12);
INSERT INTO "roysched" VALUES ('MC3021',2001,4000,14);
INSERT INTO "roysched" VALUES ('MC3021',4001,6000,16);
INSERT INTO "roysched" VALUES ('MC3021',6001,8000,18);
INSERT INTO "roysched" VALUES ('MC3021',8001,10000,20);
INSERT INTO "roysched" VALUES ('MC3021',10001,12000,22);
INSERT INTO "roysched" VALUES ('MC3021',12001,50000,24);
INSERT INTO "roysched" VALUES ('TC3218',0,2000,10);
INSERT INTO "roysched" VALUES ('TC3218',2001,4000,12);
INSERT INTO "roysched" VALUES ('TC3218',4001,6000,14);
INSERT INTO "roysched" VALUES ('TC3218',6001,8000,16);
INSERT INTO "roysched" VALUES ('TC3218',8001,10000,18);
INSERT INTO "roysched" VALUES ('TC3218',10001,12000,20);
INSERT INTO "roysched" VALUES ('TC3218',12001,14000,22);
INSERT INTO "roysched" VALUES ('TC3218',14001,50000,24);
INSERT INTO "roysched" VALUES ('PC8888',0,5000,10);
INSERT INTO "roysched" VALUES ('PC8888',5001,10000,12);
INSERT INTO "roysched" VALUES ('PC8888',10001,15000,14);
INSERT INTO "roysched" VALUES ('PC8888',15001,50000,16);
INSERT INTO "roysched" VALUES ('PS7777',0,5000,10);
INSERT INTO "roysched" VALUES ('PS7777',5001,50000,12);
INSERT INTO "roysched" VALUES ('PS3333',0,5000,10);
INSERT INTO "roysched" VALUES ('PS3333',5001,10000,12);
INSERT INTO "roysched" VALUES ('PS3333',10001,15000,14);
INSERT INTO "roysched" VALUES ('PS3333',15001,50000,16);
INSERT INTO "roysched" VALUES ('BU1111',0,4000,10);
INSERT INTO "roysched" VALUES ('BU1111',4001,8000,12);
INSERT INTO "roysched" VALUES ('BU1111',8001,10000,14);
INSERT INTO "roysched" VALUES ('BU1111',12001,16000,16);
INSERT INTO "roysched" VALUES ('BU1111',16001,20000,18);
INSERT INTO "roysched" VALUES ('BU1111',20001,24000,20);
INSERT INTO "roysched" VALUES ('BU1111',24001,28000,22);
INSERT INTO "roysched" VALUES ('BU1111',28001,50000,24);
INSERT INTO "roysched" VALUES ('MC2222',0,2000,10);
INSERT INTO "roysched" VALUES ('MC2222',2001,4000,12);
INSERT INTO "roysched" VALUES ('MC2222',4001,8000,14);
INSERT INTO "roysched" VALUES ('MC2222',8001,12000,16);
INSERT INTO "roysched" VALUES ('MC2222',12001,20000,18);
INSERT INTO "roysched" VALUES ('MC2222',20001,50000,20);
INSERT INTO "roysched" VALUES ('TC7777',0,5000,10);
INSERT INTO "roysched" VALUES ('TC7777',5001,15000,12);
INSERT INTO "roysched" VALUES ('TC7777',15001,50000,14);
INSERT INTO "roysched" VALUES ('TC4203',0,2000,10);
INSERT INTO "roysched" VALUES ('TC4203',2001,8000,12);
INSERT INTO "roysched" VALUES ('TC4203',8001,16000,14);
INSERT INTO "roysched" VALUES ('TC4203',16001,24000,16);
INSERT INTO "roysched" VALUES ('TC4203',24001,32000,18);
INSERT INTO "roysched" VALUES ('TC4203',32001,40000,20);
INSERT INTO "roysched" VALUES ('TC4203',40001,50000,22);
INSERT INTO "roysched" VALUES ('BU7832',0,5000,10);
INSERT INTO "roysched" VALUES ('BU7832',5001,10000,12);
INSERT INTO "roysched" VALUES ('BU7832',10001,15000,14);
INSERT INTO "roysched" VALUES ('BU7832',15001,20000,16);
INSERT INTO "roysched" VALUES ('BU7832',20001,25000,18);
INSERT INTO "roysched" VALUES ('BU7832',25001,30000,20);
INSERT INTO "roysched" VALUES ('BU7832',30001,35000,22);
INSERT INTO "roysched" VALUES ('BU7832',35001,50000,24);
INSERT INTO "roysched" VALUES ('PS1372',0,10000,10);
INSERT INTO "roysched" VALUES ('PS1372',10001,20000,12);
INSERT INTO "roysched" VALUES ('PS1372',20001,30000,14);
INSERT INTO "roysched" VALUES ('PS1372',30001,40000,16);
INSERT INTO "roysched" VALUES ('PS1372',40001,50000,18);
INSERT INTO "sales" VALUES ('6380','6871','1994-09-14 00:00:00',5,'Net 60','BU1032');
INSERT INTO "sales" VALUES ('6380','722a','1994-09-13 00:00:00',3,'Net 60','PS2091');
INSERT INTO "sales" VALUES ('7066','A2976','1993-05-24 00:00:00',50,'Net 30','PC8888');
INSERT INTO "sales" VALUES ('7066','QA7442.3','1994-09-13 00:00:00',75,'ON invoice','PS2091');
INSERT INTO "sales" VALUES ('7067','D4482','1994-09-14 00:00:00',10,'Net 60','PS2091');
INSERT INTO "sales" VALUES ('7067','P2121','1992-06-15 00:00:00',40,'Net 30','TC3218');
INSERT INTO "sales" VALUES ('7067','P2121','1992-06-15 00:00:00',20,'Net 30','TC4203');
INSERT INTO "sales" VALUES ('7067','P2121','1992-06-15 00:00:00',20,'Net 30','TC7777');
INSERT INTO "sales" VALUES ('7131','N914008','1994-09-14 00:00:00',20,'Net 30','PS2091');
INSERT INTO "sales" VALUES ('7131','N914014','1994-09-14 00:00:00',25,'Net 30','MC3021');
INSERT INTO "sales" VALUES ('7131','P3087a','1993-05-29 00:00:00',20,'Net 60','PS1372');
INSERT INTO "sales" VALUES ('7131','P3087a','1993-05-29 00:00:00',25,'Net 60','PS2106');
INSERT INTO "sales" VALUES ('7131','P3087a','1993-05-29 00:00:00',15,'Net 60','PS3333');
INSERT INTO "sales" VALUES ('7131','P3087a','1993-05-29 00:00:00',25,'Net 60','PS7777');
INSERT INTO "sales" VALUES ('7896','QQ2299','1993-10-28 00:00:00',15,'Net 60','BU7832');
INSERT INTO "sales" VALUES ('7896','TQ456','1993-12-12 00:00:00',10,'Net 60','MC2222');
INSERT INTO "sales" VALUES ('7896','X999','1993-02-21 00:00:00',35,'ON invoice','BU2075');
INSERT INTO "sales" VALUES ('8042','423LL922','1994-09-14 00:00:00',15,'ON invoice','MC3021');
INSERT INTO "sales" VALUES ('8042','423LL930','1994-09-14 00:00:00',10,'ON invoice','BU1032');
INSERT INTO "sales" VALUES ('8042','P723','1993-03-11 00:00:00',25,'Net 30','BU1111');
INSERT INTO "sales" VALUES ('8042','QA879.1','1993-05-22 00:00:00',30,'Net 30','PC1035');
INSERT INTO "stores" VALUES ('6380','Eric the Read Books','788 Catamaugus Ave.','Seattle','WA','98056');
INSERT INTO "stores" VALUES ('7066','Barnum''s','567 Pasadena Ave.','Tustin','CA','92789');
INSERT INTO "stores" VALUES ('7067','News & Brews','577 First St.','Los Gatos','CA','96745');
INSERT INTO "stores" VALUES ('7131','Doc-U-Mat: Quality Laundry and Books','24-A Avogadro Way','Remulade','WA','98014');
INSERT INTO "stores" VALUES ('7896','Fricative Bookshop','89 Madison St.','Fremont','CA','90019');
INSERT INTO "stores" VALUES ('8042','Bookbeat','679 Carson St.','Portland','OR','89076');
INSERT INTO "titleauthor" VALUES ('172-32-1176','PS3333',1,100);
INSERT INTO "titleauthor" VALUES ('213-46-8915','BU1032',2,40);
INSERT INTO "titleauthor" VALUES ('213-46-8915','BU2075',1,100);
INSERT INTO "titleauthor" VALUES ('238-95-7766','PC1035',1,100);
INSERT INTO "titleauthor" VALUES ('267-41-2394','BU1111',2,40);
INSERT INTO "titleauthor" VALUES ('267-41-2394','TC7777',2,30);
INSERT INTO "titleauthor" VALUES ('274-80-9391','BU7832',1,100);
INSERT INTO "titleauthor" VALUES ('409-56-7008','BU1032',1,60);
INSERT INTO "titleauthor" VALUES ('427-17-2319','PC8888',1,50);
INSERT INTO "titleauthor" VALUES ('472-27-2349','TC7777',3,30);
INSERT INTO "titleauthor" VALUES ('486-29-1786','PC9999',1,100);
INSERT INTO "titleauthor" VALUES ('486-29-1786','PS7777',1,100);
INSERT INTO "titleauthor" VALUES ('648-92-1872','TC4203',1,100);
INSERT INTO "titleauthor" VALUES ('672-71-3249','TC7777',1,40);
INSERT INTO "titleauthor" VALUES ('712-45-1867','MC2222',1,100);
INSERT INTO "titleauthor" VALUES ('722-51-5454','MC3021',1,75);
INSERT INTO "titleauthor" VALUES ('724-80-9391','BU1111',1,60);
INSERT INTO "titleauthor" VALUES ('724-80-9391','PS1372',2,25);
INSERT INTO "titleauthor" VALUES ('756-30-7391','PS1372',1,75);
INSERT INTO "titleauthor" VALUES ('807-91-6654','TC3218',1,100);
INSERT INTO "titleauthor" VALUES ('846-92-7186','PC8888',2,50);
INSERT INTO "titleauthor" VALUES ('899-46-2035','MC3021',2,25);
INSERT INTO "titleauthor" VALUES ('899-46-2035','PS2091',2,50);
INSERT INTO "titleauthor" VALUES ('998-72-3567','PS2091',1,50);
INSERT INTO "titleauthor" VALUES ('998-72-3567','PS2106',1,100);
INSERT INTO "titles" VALUES ('BU1032','The Busy Executive''s Database Guide','business','1389',19.99,5000,10,4095,'An overview of available database systems with emphasis on common business applications. Illustrated.','1991-06-12 00:00:00');
INSERT INTO "titles" VALUES ('BU1111','Cooking with Computers: Surreptitious Balance Sheets','business','1389',11.95,5000,10,3876,'Helpful hints on how to use your electronic resources to the best advantage.','1991-06-09 00:00:00');
INSERT INTO "titles" VALUES ('BU2075','You Can Combat Computer Stress!','business','0736',2.99,10125,24,18722,'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.','1991-06-30 00:00:00');
INSERT INTO "titles" VALUES ('BU7832','Straight Talk About Computers','business','1389',19.99,5000,10,4095,'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.','1991-06-22 00:00:00');
INSERT INTO "titles" VALUES ('MC2222','Silicon Valley Gastronomic Treats','mod_cook','0877',19.99,0,12,2032,'Favorite recipes for quick, easy, and elegant meals.','1991-06-09 00:00:00');
INSERT INTO "titles" VALUES ('MC3021','The Gourmet Microwave','mod_cook','0877',2.99,15000,24,22246,'Traditional French gourmet recipes adapted for modern microwave cooking.','1991-06-18 00:00:00');
INSERT INTO "titles" VALUES ('MC3026','The Psychology of Computer Cooking','UNDECIDED','0877',NULL,NULL,NULL,NULL,NULL,'2014-11-07 10:39:37');
INSERT INTO "titles" VALUES ('PC1035','But Is It User Friendly?','popular_comp','1389',22.95,7000,16,8780,'A survey of software for the naive user, focusing on the ''friendliness'' of each.','1991-06-30 00:00:00');
INSERT INTO "titles" VALUES ('PC8888','Secrets of Silicon Valley','popular_comp','1389',20,8000,10,4095,'Muckraking reporting on the world''s largest computer hardware and software manufacturers.','1994-06-12 00:00:00');
INSERT INTO "titles" VALUES ('PC9999','Net Etiquette','popular_comp','1389',NULL,NULL,NULL,NULL,'A must-read for computer conferencing.','2014-11-07 10:39:37');
INSERT INTO "titles" VALUES ('PS1372','Computer Phobic AND Non-Phobic Individuals: Behavior Variations','psychology','0877',21.59,7000,10,375,'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don''t.','1991-10-21 00:00:00');
INSERT INTO "titles" VALUES ('PS2091','Is Anger the Enemy?','psychology','0736',10.95,2275,12,2045,'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.','1991-06-15 00:00:00');
INSERT INTO "titles" VALUES ('PS2106','Life Without Fear','psychology','0736',7,6000,10,111,'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.','1991-10-05 00:00:00');
INSERT INTO "titles" VALUES ('PS3333','Prolonged Data Deprivation: Four Case Studies','psychology','0736',19.99,2000,10,4072,'What happens when the data runs dry?  Searching evaluations of information-shortage effects.','1991-06-12 00:00:00');
INSERT INTO "titles" VALUES ('PS7777','Emotional Security: A New Algorithm','psychology','0736',7.99,4000,10,3336,'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.','1991-06-12 00:00:00');
INSERT INTO "titles" VALUES ('TC3218','Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean','trad_cook','0877',20.95,7000,10,375,'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.','1991-10-21 00:00:00');
INSERT INTO "titles" VALUES ('TC4203','Fifty Years in Buckingham Palace Kitchens','trad_cook','0877',11.95,4000,14,15096,'More anecdotes from the Queen''s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.','1991-06-12 00:00:00');
INSERT INTO "titles" VALUES ('TC7777','Sushi, Anyone?','trad_cook','0877',14.99,8000,10,4095,'Detailed instructions on how to make authentic Japanese sushi in your spare time.','1991-06-12 00:00:00');
CREATE INDEX IF NOT EXISTS "idx_titleauthor_titleauthor_title_id" ON "titleauthor" (
	"title_id"
);
CREATE INDEX IF NOT EXISTS "idx_discounts_discounts_stor_id" ON "discounts" (
	"stor_id"
);
CREATE INDEX IF NOT EXISTS "idx_titles_titles_pub_id" ON "titles" (
	"pub_id"
);
CREATE INDEX IF NOT EXISTS "idx_employee_employee_job_id" ON "employee" (
	"job_id"
);
CREATE INDEX IF NOT EXISTS "idx_employee_employee_pub_id" ON "employee" (
	"pub_id"
);
CREATE INDEX IF NOT EXISTS "idx_sales_sales_title_id" ON "sales" (
	"title_id"
);
CREATE INDEX IF NOT EXISTS "idx_roysched_roysched_title_id" ON "roysched" (
	"title_id"
);
COMMIT;
