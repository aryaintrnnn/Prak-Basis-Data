
## Documentation
**UTS**

Ubah sesuai intruksi berikut :

**AWAL :**
```
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
```
**UBAH MENJADI :**
```
CREATE DATABASE STIKOM_3 DIGIT AKHIR NIM
ON PRIMARY
(
   NAME = STIKOM_3 DIGIT AKHIR NIM_DATA,
   FILENAME = 'lokasi_folder/STIKOM_3 DIGIT AKHIR NIM_DATA.mdf',
   SIZE = 5MB,
   MAXSIZE = 100MB,
   FILEGROWTH = 3MB
)
LOG ON
(
   NAME = STIKOM_3 DIGIT AKHIR NIM_LOG,
   FILENAME = '/lokasi_folder/STIKOM_3 DIGIT AKHIR NIM_LOG.ldf',
   SIZE = 5MB,
   MAXSIZE = 100MB,
   FILEGROWTH = 3MB
);
```

**AWAL :**
```
USE STIKOM_273;
```

**UBAH MENJADI :**

```
USE STIKOM_2 DIGIT AKHIR NIM;
```

**AWAL : **
```
INSERT INTO Poliklinik (kd_poliklinik, nama, hari_buka, jenis_instalasi) VALUES
    ('P01', 'Poliklinik Jantung', 'Senin-Jumat', 0),
    ('P02', 'Poliklinik Anak', 'Senin-Sabtu', 1);
```
** UBAH MENJADI : **
```
INSERT INTO Poliklinik (kd_poliklinik, nama, hari_buka, jenis_instalasi) VALUES
    ('bebas 1 huruf 2 angka', 'Poliklinik Jantung', 'Senin-Jumat', 0),
    ('bebas 1 huruf 2 angka', 'Poliklinik Anak', 'Senin-Sabtu', 1);
```

**AWAL :**
```
INSERT INTO Pasien (no_pasien, nama, alamat, kota, jenis_pasien) VALUES
    ('P001', 'Budi', 'Jl. Pahlawan No. 10', 'Denpasar', 'Lama'),
    ('P002', 'Rini', 'Jl. Kusuma Bangsa No. 5', 'Tabanan', 'Baru');
```

**UBAH MENJADI :**
```
INSERT INTO Pasien (no_pasien, nama, alamat, kota, jenis_pasien) VALUES
    ('bebas 1 huruf 3 angka', 'nama bebas', 'alamat bebas', 'Denpasar', 'Lama'),
    ('bebas 1 huruf 3 angka', 'nama bebas', 'alamat bebas', 'Denpasar', 'Lama');
```




