use PENJUALANDVD;

create table MOVIE(
	KODE_DVD VARCHAR(10) not null,
	JUDUL VARCHAR(60) not null,
	HARGA_SEWA DOUBLE not null,
	DENDA DOUBLE not null,
	TAHUN_RILIS SMALLINT not null,
	primary key (KODE_DVD)
);


create table GENRE(
	ID_GENRE SMALLINT primary key,
	GENRE VARCHAR(10) not null
);

create table GENRE_MOVIE(
	ID_GENRE SMALLINT references GENRE(ID_GENRE),
	KODE_DVD VARCHAR(10) references MOVIE(KODE_DVD),
	primary key (ID_GENRE,KODE_DVD)
);

create table KECAMATAN(
	ID_KECAMATAN smallint (10)primary key,
	KECAMATAN VARCHAR(45)not null
);

create table KELURAHAN(
	ID_KELURAHAN smallint primary key,
	ID_KECAMATAN smallint references KECAMATAN(ID_KECAMATAN),
	KELURAHAN VARCHAR(45)not null
);

create table PELANGGAN(
	KODE_PELANGGAN VARCHAR(10)primary key,
	ID_KELURAHAN smallint references KELURAHAN(ID_KELURAHAN),
	NAMA VARCHAR(45)not null,
	ALAMAT VARCHAR(45)not null,
	JENIS_KELAMIN CHAR(1)not null,
	constraint chk_JENIS_KELAMIN check (JENIS_KELAMIN in ('P','L'))
);

create table TRANSAKSI(
	KODE_DVD VARCHAR(10)references MOVIE(KODE_DVD),
	KODE_PELANGGAN VARCHAR(10)references PELANGGAN(KODE_PELANGGAN),
	TANGGAL_SEWA DATE primary key,
	TANGGAL_WAJIB_KEMBALI DATE not null,
	TANGGAL_REALISASI_KEMBALI DATE not null
);

alter table MOVIE modify TAHUN_RILIS YEAR(4);
