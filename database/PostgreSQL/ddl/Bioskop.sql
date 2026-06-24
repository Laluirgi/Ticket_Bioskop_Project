-- =====================================================
-- DATABASE SISTEM TIKET BIOSKOP
-- =====================================================

DROP TABLE IF EXISTS tb_pembayaran CASCADE;
DROP TABLE IF EXISTS tb_tiket CASCADE;
DROP TABLE IF EXISTS tb_pemesanan CASCADE;
DROP TABLE IF EXISTS tb_kursi CASCADE;
DROP TABLE IF EXISTS tb_jadwal CASCADE;
DROP TABLE IF EXISTS tb_studio CASCADE;
DROP TABLE IF EXISTS tb_film CASCADE;
DROP TABLE IF EXISTS tb_pelanggan CASCADE;

-- =====================================================
-- TABEL PELANGGAN
-- =====================================================

CREATE TABLE tb_pelanggan (
    id_pelanggan SERIAL PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    no_hp VARCHAR(20) NOT NULL,
    alamat TEXT,
    password VARCHAR(255) NOT NULL
);

-- =====================================================
-- TABEL FILM
-- =====================================================

CREATE TABLE tb_film (
    id_film SERIAL PRIMARY KEY,
    judul VARCHAR(150) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    durasi INT NOT NULL,
    rating_usia VARCHAR(10),
    sinopsis TEXT,
    poster VARCHAR(255)
);

-- =====================================================
-- TABEL STUDIO
-- =====================================================

CREATE TABLE tb_studio (
    id_studio SERIAL PRIMARY KEY,
    nama_studio VARCHAR(50) NOT NULL,
    kapasitas INT NOT NULL
);

-- =====================================================
-- TABEL JADWAL
-- =====================================================

CREATE TABLE tb_jadwal (
    id_jadwal SERIAL PRIMARY KEY,
    id_film INT NOT NULL,
    id_studio INT NOT NULL,
    tanggal_tayang DATE NOT NULL,
    jam_tayang TIME NOT NULL,
    harga_tiket NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_jadwal_film
        FOREIGN KEY (id_film)
        REFERENCES tb_film(id_film)
        ON DELETE CASCADE,

    CONSTRAINT fk_jadwal_studio
        FOREIGN KEY (id_studio)
        REFERENCES tb_studio(id_studio)
        ON DELETE CASCADE
);

-- =====================================================
-- TABEL KURSI
-- =====================================================

CREATE TABLE tb_kursi (
    id_kursi SERIAL PRIMARY KEY,
    id_studio INT NOT NULL,
    nomor_kursi VARCHAR(10) NOT NULL,
    status_kursi VARCHAR(20) DEFAULT 'TERSEDIA',

    CONSTRAINT fk_kursi_studio
        FOREIGN KEY (id_studio)
        REFERENCES tb_studio(id_studio)
        ON DELETE CASCADE
);

-- =====================================================
-- TABEL PEMESANAN
-- =====================================================

CREATE TABLE tb_pemesanan (
    id_pemesanan SERIAL PRIMARY KEY,
    id_pelanggan INT NOT NULL,
    tanggal_pesan TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_harga NUMERIC(10,2) NOT NULL,
    status_pemesanan VARCHAR(20) DEFAULT 'MENUNGGU',

    CONSTRAINT fk_pemesanan_pelanggan
        FOREIGN KEY (id_pelanggan)
        REFERENCES tb_pelanggan(id_pelanggan)
        ON DELETE CASCADE
);

-- =====================================================
-- TABEL PEMBAYARAN
-- =====================================================

CREATE TABLE tb_pembayaran (
    id_pembayaran SERIAL PRIMARY KEY,
    id_pemesanan INT NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    total_bayar NUMERIC(10,2) NOT NULL,
    status_pembayaran VARCHAR(20) DEFAULT 'MENUNGGU',
    tanggal_bayar TIMESTAMP,

    CONSTRAINT fk_pembayaran_pemesanan
        FOREIGN KEY (id_pemesanan)
        REFERENCES tb_pemesanan(id_pemesanan)
        ON DELETE CASCADE
);

-- =====================================================
-- TABEL TIKET
-- =====================================================

CREATE TABLE tb_tiket (
    id_tiket SERIAL PRIMARY KEY,
    id_pemesanan INT NOT NULL,
    id_jadwal INT NOT NULL,
    id_kursi INT NOT NULL,
    kode_tiket VARCHAR(50) UNIQUE NOT NULL,
    status_tiket VARCHAR(20) DEFAULT 'AKTIF',

    CONSTRAINT fk_tiket_pemesanan
        FOREIGN KEY (id_pemesanan)
        REFERENCES tb_pemesanan(id_pemesanan)
        ON DELETE CASCADE,

    CONSTRAINT fk_tiket_jadwal
        FOREIGN KEY (id_jadwal)
        REFERENCES tb_jadwal(id_jadwal)
        ON DELETE CASCADE,

    CONSTRAINT fk_tiket_kursi
        FOREIGN KEY (id_kursi)
        REFERENCES tb_kursi(id_kursi)
        ON DELETE CASCADE
);
