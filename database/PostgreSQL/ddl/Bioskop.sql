DROP TABLE IF EXISTS tb_tiket CASCADE;
DROP TABLE IF EXISTS tb_pembayaran CASCADE;
DROP TABLE IF EXISTS tb_pemesanan CASCADE;
DROP TABLE IF EXISTS tb_jadwal CASCADE;
DROP TABLE IF EXISTS tb_kursi CASCADE;
DROP TABLE IF EXISTS tb_studio CASCADE;
DROP TABLE IF EXISTS tb_film CASCADE;
DROP TABLE IF EXISTS tb_pelanggan CASCADE;

CREATE TABLE tb_pelanggan (
    id_pelanggan VARCHAR(50) PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL,   
    no_hp VARCHAR(20),                    
    alamat TEXT,                          
    password VARCHAR(255) NOT NULL        
);

CREATE TABLE tb_film (
    id_film VARCHAR(50) PRIMARY KEY,
    judul VARCHAR(150) NOT NULL,
    genre VARCHAR(100),
    poster VARCHAR(255)
);

CREATE TABLE tb_studio (
    id_studio VARCHAR(50) PRIMARY KEY,
    nama_studio VARCHAR(50) NOT NULL
);

CREATE TABLE tb_jadwal (
    id_jadwal VARCHAR(50) PRIMARY KEY,
    id_film VARCHAR(50) REFERENCES tb_film(id_film) ON DELETE CASCADE,
    id_studio VARCHAR(50) REFERENCES tb_studio(id_studio) ON DELETE CASCADE,
    tanggal DATE NOT NULL,
    jam_tayang TIME NOT NULL
);

CREATE TABLE tb_pemesanan (
    id_pemesanan VARCHAR(50) PRIMARY KEY,
    id_pelanggan VARCHAR(50) REFERENCES tb_pelanggan(id_pelanggan) ON DELETE CASCADE,
    tgl_pesan TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tb_tiket (
    id_tiket VARCHAR(50) PRIMARY KEY,
    id_pemesanan VARCHAR(50) REFERENCES tb_pemesanan(id_pemesanan) ON DELETE CASCADE,
    id_jadwal VARCHAR(50) REFERENCES tb_jadwal(id_jadwal) ON DELETE CASCADE
);    
