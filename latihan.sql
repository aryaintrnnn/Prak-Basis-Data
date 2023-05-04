--create database Hotel

create database Hotel_INTRN
on primary
(
	name = 'Bali Beach',
	filename = 'D:\hotel_intrn\Wayan.mdf',
	size = 10MB,
	maxsize = unlimited,
	filegrowth = 50MB
)
log on
(
	name = 'Prime',
	filename = 'D:\hotel_intrn\Made.ldf',
	size = 4MB,
	maxsize = 500MB,
	filegrowth = 10MB
)
go

use Hotel_INTRN
go

create table ms_student
(
    Student_id char(5),
    Student_name varchar(30),
    Student_address varchar(50),
    Student_phone varchar(13),
    Student_email varchar(50),
    Student_gender varchar(6),
    Student_birth datetime,
)
    go

create table ms_tutor
(
    Tutor_id char(5),
    Tutor_name varchar(30),
    Tutor_address varchar(50),
    Tutor_phone varchar(13),
    Tutor_email varchar(50),
    Tutor_gender varchar(6),
    Tutor_birth datetime,
)
    go

create table ms_program
(
    Program_id char(5),
    Program_name varchar(50),
    Fee numeric,
    Program_duration varchar(20),
)
    go

create table ms_grade
(
    grade_id char(1),
    nilai varchar(7),
    discount varchar(4),
)
    go

-- TR PAYMENT
create table tr_payment
(
    payment_id varchar(5),
    regist_id varchar(5),
    total_payment varchar(10),
)
    go

INSERT INTO MS_TUTOR (TUTOR_ID, TUTOR_NAME, TUTOR_ADDRESS, TUTOR_PHONE, TUTOR_EMAIL, TUTOR_GENDER, TUTOR_BIRTH)
VALUES
	('D1908','rendi','songan','083075639528','rendi123@gmail.com','male','01/10/2000'),
	('D1908','risti','giayar','081749264807','risti123@gmail.com','female','02/14/2001'),
	('D1507','dek ari','muncan','087939026496','dekari123@gmail.com','male','05/19/2003'),
	('D0708','enjel','jl sudirman 98','085294629064','enjel123@gmail.com','female','02/11/2000'),
	('D0612','luh indah','bangli','0896306749269','luhindah123@gmail.com','female','07/20/2004');

INSERT INTO ms_student (student_id, student_name, student_address, student_phone, student_email, student_gender, student_birth)
VALUES
    ('80862','bunga','jl balian','0827496494027','bunga123@gmail.com','female','01/20/2004'),
    ('80862','sintia','bangli','085742874027','sintia123@gmail.com','female','03/20/2004'),
    ('82205','wira','tembuku yangapi 6','08137927908','wira123@gmail.com','male','04/22/2005'),
    ('82312','liana','jl besakih','081740378027','liana123@gmail.com','female','03/23/2005'),
    ('85313','wayan adi','tembuku','08775942308','adiyan123@gmail.com','male','05/21/2003'),
    ('81234','hendra','kintamani','087379953708','hendra123@gmail.com','male','03/12/2003'),
    ('84321','mahalini','jakarta','083749078067','mahalini123@gmail.com','female','03/17/2001'),
    ('87078','beta','papua','081239786092','beta123@gmail.com','male','04/17/2004'),
    ('83421','krisna','lombok','087936400264','krisna123@gmail.com','male','02/24/2002'),
    ('88139','perdi','malang','08103745380','perdi123@gmail.com','male','01/11/2004');

INSERT INTO MS_PROGRAM (PROGRAM_ID, PROGRAM_NAME, FEE, PROGRAM_DURATION)
VALUES
    ('PC001','COVERSATION','1500000','12'),
    ('PC001','TEOFL Prepartion','2000000','12'),
    ('PC001','General English','1000000','12');

INSERT INTO MS_GRADE (GRADE_ID, NILAI, DISCOUNT)
VALUES
    ('A','85-100','10%'),
    ('B','75-84','5%'),
    ('C','0-74','0%')

INSERT INTO tr_payment (payment_id, regist_id, total_payment) VALUES
    ('PO101', 'REG001', '1900000'),
    ('PO102', 'REG002', '900000'),
    ('PO103', 'REG003', '1424000'),
    ('PO104', 'REG004', '1900000'),
    ('PO105', 'REG005', '2000000'),
    ('PO106', 'REG006', '950000'),
    ('PO107', 'REG007', '1500000'),
    ('PO108', 'REG008', '1000000'),
    ('PO109', 'REG009', '1500000'),
    ('PO110', 'REG010', '1900000');

DELETE ms_student

SELECT * FROM ms_student

ALTER TABLE ms_student
ALTER COLUMN student_id char(5) NOT NULL

ALTER TABLE ms_student
    ADD CONSTRAINT pk_ms_student_student_id PRIMARY KEY (student_id)

ALTER TABLE ms_student
    ADD CONSTRAINT chk_ms_student_student_gender CHECK (student_gender IN ('Male','Female'))

ALTER TABLE ms_student
    ADD CONSTRAINT chk_ms_student_student_birth CHECK (student_birth BETWEEN '09/01/1980' AND '12/31/2005')

SELECT * FROM ms_program

ALTER TABLE ms_program WITH NOCHECK
    ADD CONSTRAINT chk_ms_program_fee CHECK (fee >= 1000000 AND fee <= 5000000)

-- TANPA DISTINCT
SELECT Program_id
FROM ms_program

-- DENGAN DISTINCT
SELECT DISTINCT Program_id
FROM ms_program

-- TANPA DISTINCT
SELECT Program_id, Program_name
FROM ms_program

-- DENGAN DISTINCT
SELECT DISTINCT Program_id, Program_name
FROM ms_program

--Total Payment +100
SELECT payment_id, regist_id, total_payment
FROM tr_payment

SELECT payment_id, regist_id, total_payment + 100 as Bayar
FROM tr_payment

--Total Payment + 10%
SELECT payment_id, regist_id, total_payment
FROM tr_payment

SELECT payment_id, regist_id, total_payment, 0.1 * total_payment as Bayar
FROM tr_payment

--Total Payment perbulan
SELECT payment_id, regist_id, total_payment
FROM tr_payment

SELECT payment_id, regist_id, total_payment, total_payment/12 as Bayar
FROM tr_payment

--Jumlah Pembayaran lebih dari 1000000
SELECT payment_id, regist_id, total_payment
FROM tr_payment
WHERE total_payment > 1000000

--Total Payment yang tidak sama dengan 1500000
SELECT payment_id, regist_id, total_payment
FROM tr_payment
WHERE total_payment <> 1500000

--Total Payment yang kurang atau sama dengan 1500000
SELECT payment_id, regist_id, total_payment
FROM tr_payment
WHERE total_payment <= 1500000