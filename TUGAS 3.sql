create database Akademik;
use Akademik;

create table FAKULTAS(
	ID_FAKULTAS smallint primary key,
	FAKULTAS VARCHAR(45) not NULL
);

create table JURUSAN(
	ID_JURUSAN smallint primary key,
	ID_FAKULTAS smallint references FAKULTAS(ID_FAKULTAS),
	JURUSAN VARCHAR(45) not NULL
);

create table STRATA(
	ID_STRATA smallint primary key,
	SINGKAT VARCHAR(10) not null,
	STRATA VARCHAR(45) not NULL
);

create table PROGRAM_STUDI(
	ID_PROGRAM_STUDI smallint primary key,
	ID_STRATA smallint references STRATA(ID_STRATA),
	ID_JURUSAN smallint references JURUSAN(ID_JURUSAN),
	PROGRAM_STUDI VARCHAR(60) not NULL
);

create table SELEKSI_MASUK(
	ID_SELEKSI_MASUK smallint primary key,
	SINGKAT VARCHAR(12) not null,
	SELEKSI_MASUK VARCHAR(60) not NULL
);

create table MAHASISWA(
	NIM VARCHAR(15) primary key,
	ID_SELEKSI_MASUK smallint references SELEKSI_MASUK(ID_SELEKSI_MASUK),
	ID_PROGRAM_STUDI smallint references PROGRAM_STUDI(ID_PROGRAM_STUDI),
	NAMA VARCHAR(45) not null,
	ANGKATAN smallint not null,
	TGL_LAHIR DATE not null,
	KOTA_LAHIR VARCHAR(60) not null,
	JENIS_KELAMIN CHAR(1) not null
);


insert into FAKULTAS(ID_FAKULTAS, FAKULTAS)
values (1, 'Ekonomi & Bisnis')

insert into FAKULTAS(ID_FAKULTAS, FAKULTAS)
values (2, 'Ilmu Komputer')

insert into JURUSAN(ID_JURUSAN, ID_FAKULTAS, JURUSAN)
values (21, 2, 'Informatika')

insert into JURUSAN(ID_JURUSAN, ID_FAKULTAS, JURUSAN)
values (22, 2, 'Sistem Informasi')

insert into JURUSAN(ID_JURUSAN, ID_FAKULTAS, JURUSAN)
values (23, 2, 'Teknik Komputer')

select * from JURUSAN;

insert into STRATA(ID_STRATA, SINGKAT, STRATA)
values (1, 'D1','Diploma'), (2, 'S1', 'Sarjana'), (3, 'S2', 'Magister');

insert into PROGRAM_STUDI(ID_PROGRAM_STUDI, ID_STRATA, ID_JURUSAN, PROGRAM_STUDI) 
values (211, 2, 21, 'Teknik Informatika'),(212, 2, 21, 'Teknik Komputer'), (219, 3, 21, 'Magister Ilmu Komputer');

insert into SELEKSI_MASUK (ID_SELEKSI_MASUK, SINGKAT, SELEKSI_MASUK)
values (1, 'SNMPTN', 'SELEKSI NASIONAL MAHASISWA PERGURUAN TINGGI NEGERI'), (2, 'SBMPTN', 'SELEKSI BERSAMA MAHASISWA PERGURUAN TINGGI NEGERI');

insert into MAHASISWA (NIM, ID_SELEKSI_MASUK, ID_PROGRAM_STUDI, NAMA, ANGKATAN, TGL_LAHIR, KOTA_LAHIR, JENIS_KELAMIN)
values (155150400, 1, 211, 'JONI', 2015, 1/1/1997,'Malang', 'w'), (155150401, 2, 212, 'JONO', 2015, 2/10/1997, 'Situbondo', 'p');

select * from FAKULTAS;
select * from JURUSAN;
select * from PROGRAM_STUDI;
select * from STRATA;
select * from SELEKSI_MASUK;
select * from MAHASISWA;
