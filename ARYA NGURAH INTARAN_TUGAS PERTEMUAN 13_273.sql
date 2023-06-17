-- ARYA NGURAH INTARAN
-- 220040273

CREATE TABLE rental_film
ON PRIMARY
( NAME = rental_film_273_DATA,
 FILENAME = 'C:\aryai_273_DATA.mdf',
 SIZE = 5MB,
 MAXSIZE = 500MB,
 FILEGROWTH = 3MB )
LOG ON
( NAME = rental_film_273_LOG,
 FILENAME = 'C:\aryai_273_LOG.ldf',
 SIZE = 5MB,
 MAXSIZE = 500MB,
 FILEGROWTH = 3MB )

USE rental_film

CREATE TABLE Pegawai
(
    id_karyawan CHAR(5) PRIMARY KEY NOT NULL,
    nama_depan VARCHAR(30),
    ID_Dapartemen CHAR(2),
    Upah CHAR(7),
)

CREATE TABLE Kinerja_Pegawai
(
    ID_Karyawan CHAR(5) FOREIGN KEY REFERENCES Pegawai(ID_Karyawan) ON UPDATE CASCADE ON DELETE CASCADE,
    Bulan CHAR(2),
    Kinerja CHAR(3),
)

INSERT INTO Pegawai VALUES 
    ('100','Gede Ronaldo','20','10000'),
    ('101','Ketut Poltak','20','20000'),
    ('102','Made Suroto','30','15000'),
    ('103','Wayan Muhammad','10','12000'),
    ('104','Luh Angelina','50','25000'),
    ('105','Putu Mely','10','22000');

INSERT INTO Kinerja_Pegawai VALUES 
    ('100','01','80'),
    ('100','02','85'),
    ('100','03','75'),
    ('101','02','90'),
    ('101','03','70'),
    ('102','01','90'),
    ('102','02','95');


SELECT * FROM pegawai
WHERE upah < (SELECT upah FROM pegawai WHERE id_karyawan = '105')

SELECT MIN (Kinerja) AS [nilai terendah]
FROM Kinerja_Pegawai
WHERE ID_Karyawan = (SELECT ID_Karyawan FROM Pegawai
WHERE nama_depan = 'Gede Ronaldo')

CREATE TABLE MsFilm
(
    KdVcd CHAR(6) PRIMARY KEY NOT NULL,
    Judul VARCHAR(30),
    StatusPinjam CHAR(1),
)

CREATE TABLE MsPeminjam
(
    KdPeminjaman CHAR(6) PRIMARY KEY NOT NULL,
    NmPeminjam VARCHAR(15),
    KTP CHAR(15),
    Alamat VARCHAR(20),
    Telp CHAR(10),
)


CREATE TABLE TrPinjam
(
    KdTransaksi CHAR(7),
    TglPinjam CHAR(10),
    KdPeminjaman CHAR(6) FOREIGN KEY REFERENCES MsPeminjam(KdPeminjaman) ON UPDATE CASCADE ON DELETE CASCADE,
    KdVcd CHAR(6) FOREIGN KEY REFERENCES MsFilm(KdVcd) ON UPDATE CASCADE ON DELETE CASCADE,
    LamaPinjam CHAR(1),
    TglKembali CHAR(10),
    Denda CHAR(4),
)

INSERT INTO MsFilm VALUES 
    ('KM001','The Mask','Y'),
    ('KM002','Maju kena mundur nggak kena','T'),
    ('KR001','Naruto Shipdeh','T'),
    ('AC001','Rambu','T'),
    ('FS001','Suparman','T'),
    ('AC002','Speed o meter','Y');

INSERT INTO MsPeminjam VALUES
    ('P0001','Made Rimpeg','20049876','Jl Drupadi No 99','484844'),
    ('P0002','Ketut Sempong','20059876','Jl Imam Bonjol 22','567845'),
    ('P0003','Sathosi','20051111','Jl Kebo Iwo 20','487563'),
    ('P0004','Kim Tae Hun','20065432','Jl Teuku Umar 32','578612');

INSERT INTO TrPinjam VALUES
    ('TR001','1/1/2008','P0001','KM001','6','1/7/2008', ''),
    ('TR002','1/1/2008','P0002','AC001','6','1/8/2008','500'),
    ('TR003','1/1/2008','P0003','AC002','6','1/7/2008', ''),
    ('TR004','1/1/2008','P0004','FS001','6','1/9/2008','1000'),
    ('TR005','1/2/2008','P0001','KR001','6','1/10/2008', ''),
    ('TR006','1/10/2008','P0003','KM001','6','1/19.2008','1500');

SELECT *
FROM TrPinjam
WHERE TglKembali > TglPinjam + LamaPinjam

SELECT * FROM MsFilm
WHERE KdVcd NOT IN (SELECT DISTINCT (KdVcd) FROM TrPinjam)

SELECT  MsFilm. *
FROM MsFilm INNER JOIN TrPinjam  ON MsFilm.KdVcd = TrPinjam.KdVcd
WHERE TrPinjam.TglKembali > TrPinjam.TglPinjam + TrPinjam.LamaPinjam 

SELECT *
FROM MsPeminjam
WHERE KdPeminjaman IN (SELECT DISTINCT KdPeminjaman FROM TrPinjam WHERE denda > 0)