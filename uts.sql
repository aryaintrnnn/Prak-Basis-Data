CREATE DATABASE STIKOM_273
ON PRIMARY
(
   NAME = STIKOM_273_DATA,
   FILENAME = '/home/intrn/Desktop/prak-basis-data/STIKOM_273_DATA.mdf',
   SIZE = 5MB,
   MAXSIZE = 100MB,
   FILEGROWTH = 3MB
)
LOG ON
(
   NAME = STIKOM_273_LOG,
   FILENAME = '/home/intrn/Desktop/prak-basis-data/STIKOM_273_LOG.ldf',
   SIZE = 5MB,
   MAXSIZE = 100MB,
   FILEGROWTH = 3MB
);

USE STIKOM_273;

-- Tabel Pasien
CREATE TABLE Pasien (
   No_Pasien CHAR(5) NOT NULL,
   Nama VARCHAR(30) NOT NULL,
   Alamat VARCHAR(50) NOT NULL,
   Kota VARCHAR(15) NULL,
   Telp VARCHAR(15) NULL
);

-- Tabel Poliklinik
CREATE TABLE Poliklinik (
   Kd_poliklinik CHAR(3) NOT NULL,
   Nama VARCHAR(50) NULL,
   Hari_buka VARCHAR(20) NULL
);

-- Tambah kolom Jenis_Instalasi pada tabel Poliklinik
ALTER TABLE Poliklinik
ADD Jenis_Instalasi VARCHAR(30) NULL;

-- Tambah kolom Jenis_Pasien pada tabel Pasien
ALTER TABLE Pasien
ADD Jenis_Pasien VARCHAR(10) NULL;

-- Ubah tipe data kolom Jenis_Instalasi pada tabel Poliklinik menjadi NUMERIC
ALTER TABLE Poliklinik
ALTER COLUMN Jenis_Instalasi NUMERIC(10,2) NULL;

-- Hapus kolom Telp pada tabel Pasien
ALTER TABLE Pasien
DROP COLUMN Telp;

-- Menambahkan constraint pada tabel Pasien
ALTER TABLE Pasien
ADD CONSTRAINT PK_Pasien PRIMARY KEY (No_Pasien),
ADD CONSTRAINT CK_Nama_Pasien CHECK (Nama IS NOT NULL),
ADD CONSTRAINT CK_Alamat_Pasien CHECK (Alamat IS NOT NULL),
ADD CONSTRAINT CK_Jenis_Pasien CHECK (Jenis_Pasien IS NOT NULL),
ADD CONSTRAINT CK_Panjang_Jenis_Pasien CHECK (LEN(Jenis_Pasien) <= 10);

-- Menambahkan constraint pada tabel Poliklinik
ALTER TABLE Poliklinik
ADD CONSTRAINT PK_Poliklinik PRIMARY KEY (Kd_poliklinik),
ADD CONSTRAINT CK_Nama_Poliklinik CHECK (LEN(Nama) <= 50),
ADD CONSTRAINT CK_Hari_Buka CHECK (LEN(Hari_buka) <= 20),
ADD CONSTRAINT CK_Jenis_Instalasi CHECK (Jenis_Instalasi IS NULL OR ISNUMERIC(Jenis_Instalasi) = 1);

ALTER TABLE Pasien
ADD CONSTRAINT jenis_pasien_constraint CHECK (jenis_pasien IN ('Lama', 'Baru', 'Rujukan'));

ALTER TABLE Poliklinik
ADD CONSTRAINT jenis_instalasi_constraint CHECK (jenis_instalasi BETWEEN 0 AND 2);

-- Menambahkan 2 record ke table Poliklinik
INSERT INTO Poliklinik (kd_poliklinik, nama, hari_buka, jenis_instalasi) VALUES
    ('P01', 'Poliklinik Jantung', 'Senin-Jumat', 0),
    ('P02', 'Poliklinik Anak', 'Senin-Sabtu', 1);

-- Menambahkan 2 record ke table Pasien
INSERT INTO Pasien (no_pasien, nama, alamat, kota, jenis_pasien) VALUES
    ('P001', 'Budi', 'Jl. Pahlawan No. 10', 'Denpasar', 'Lama'),
    ('P002', 'Rini', 'Jl. Kusuma Bangsa No. 5', 'Tabanan', 'Baru');

-- Mengupdate kolom hari_buka pada poliklinik jenis_instalasi 0 menjadi "Senin-Jumat"
UPDATE Poliklinik
SET hari_buka = 'Senin-Jumat'
WHERE jenis_instalasi = 0;

-- Mengupdate kolom hari_buka pada poliklinik jenis_instalasi 1 dan 2 menjadi "Senin-Minggu"
UPDATE Poliklinik
SET hari_buka = 'Senin-Minggu'
WHERE jenis_instalasi IN (1, 2);

-- Menghapus data pada Pasien dengan jenis_pasien selain "Lama" dan kota bukan "Denpasar" atau "Tabanan"
DELETE FROM Pasien
WHERE jenis_pasien NOT IN ('Lama') AND (kota NOT IN ('Denpasar', 'Tabanan') OR kota IS NULL);




