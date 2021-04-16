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
