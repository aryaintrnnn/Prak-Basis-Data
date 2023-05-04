-- NAMA : Arya Ngurah Intaran
-- NIM : 220040273
-- KELAS : BD224

--- Sisipan record data
INSERT INTO ms_student(student_id, student_name, student_address, student_phone, student_email, student_gender, student_birth) VALUES
    ('80692','LilySiswani','Jl Tukad Yeh Aye','085920735341','lily@yahoo.com','female','11/03/1989'),
    ('08062','Stella Clarissa','Ubung','081808887933','stellycious@yahoo.com','female','09/08/1988'),
    ('82205','Agustino','Puputan Renon 6','08180834234','tino_she@yahoo.com','male','07/08/1988'),
    ('82312','Imelda Putri','Jl Gunung Agung','08569463434','putri@yahoo.co.id','female','12/07/1988'),
    ('85131','Ketut Joni','Gianyar','08563434423','joni@yahoo.com','male','06/12/1987'),
    ('81234','Hendri','Sangeh','0361223344','hendri@stikom.com','male','04/04/1989'),
    ('84321','Agnes','Jakarta','08172217865','agnes@yahoo.com','female','10/02/1987'),
    ('87078','Kaka','Brasil','0361237468','kaka@brasil.com','male','12/12/1986'),
    ('83421','Torres','Spanyol','0878765456','Torres@spanyol.com','male','02/02/1988'),
    ('88139','Pato','Brasil','031234572','Pato.brasil.com','male','02/07/1986'),
INSERT INTO ms_tutor(tutor_id, tutor_name, tutor_address, tutor_phone, tutor_email, tutor_gender, tutor_birth) VALUES
    ('D1908','Robert','sukawati 56','0818277345','Robert@yahoo.com','male','10/09/19670'),
    ('D1989','Ayu Nurani','Tanah Lot','0361298782','Ayu@yahoo.com','female','08/05/1973'),
    ('D1507','Joko Susanto','Klitren','0274231398','joko@gmail.com','male','08/07/1972'),
    ('D0707','Angelina','Jl Selaparang 60','0370616728','angel@telkom.co.id','female','10/12/1969'),
    ('D0612','Indah Dewi','Denpasar','0361567567','indah@hotmail.com','female','11/06/1977'),

INSERT INTO ms_program(program_id, program_name, fee, duration) VALUES
    ('PC001','Conversation','1500000','12')
    ('PP001','TEOFLPreparation','2000000','12')
    ('PG001','GeneralEnglish','1000000','12')

INSERT INTO ms_grade(grade_id, nilai, discount) VALUES
    ('A','85-100','10%')
    ('B','75-84','5%')
    ('C','0-74','0%')

-- Perintah SQL untuk merubah duras ms_program
-- menjadi 10 untuk fee dibawah 2000000
UPDATE ms_program SET duration = 10 WHERE fee < 2000000;

-- Perintah SQL untuk merubah duras ms_program menjadi
-- 12 dan fee menjadi 1500000 untuk durasi = 10 dan fee
-- kurang dari 1500000
UPDATE ms_program SET duration = 12, fee = 1500000 WHERE duration = 10 < 1500000;

-- Perintah SQL untuk menghapus data tutor menghapus data
-- tutor yang jenis kelaminnya perempuan atau tinggalnya di
-- di denpasar
DELETE FROM tutor WHERE student_gender = 'female' OR student_address = 'denpasar';