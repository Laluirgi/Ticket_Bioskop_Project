CREATE TABLE tb_pelanggan (
    id_pelanggan VARCHAR(50) PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    no_hp VARCHAR(20),
    password VARCHAR(255) NOT NULL,
    alamat TEXT
);
CREATE TABLE tb_film (
    id_film VARCHAR(50) PRIMARY KEY,
    judul VARCHAR(150) NOT NULL,
    genre VARCHAR(50),
    durasi INT,
    rating_usia VARCHAR(10)
);
CREATE TABLE tb_admin (
    id_admin VARCHAR(50) PRIMARY KEY,
    nama_admin VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE tb_studio (
    id_studio VARCHAR(50) PRIMARY KEY,
    nama_studio VARCHAR(50) NOT NULL,
    kapasitas INT,
    jenis_studio VARCHAR(50)
);
CREATE TABLE tb_kursi (
    id_kursi VARCHAR(50) PRIMARY KEY,
    id_studio VARCHAR(50) REFERENCES tb_studio(id_studio),
    nomor_kursi VARCHAR(10) NOT NULL
);
CREATE TABLE tb_produk (
    id_produk VARCHAR(50) PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    kategori VARCHAR(50),
    harga DECIMAL(10, 2),
    stok INT,
    id_admin VARCHAR(50) REFERENCES tb_admin(id_admin)
);
CREATE TABLE tb_jadwal (
    id_jadwal VARCHAR(50) PRIMARY KEY,
    tanggal DATE NOT NULL,
    jam_tayang TIME NOT NULL,
    harga_tiket DECIMAL(10, 2),
    id_film VARCHAR(50) REFERENCES tb_film(id_film),
    id_studio VARCHAR(50) REFERENCES tb_studio(id_studio),
    id_admin VARCHAR(50) REFERENCES tb_admin(id_admin)
);
CREATE TABLE tb_pemesanan (
    id_pemesanan VARCHAR(50) PRIMARY KEY,
    id_pelanggan VARCHAR(50) REFERENCES tb_pelanggan(id_pelanggan),
    tgl_pesan TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_harga DECIMAL(10, 2),
    status_pemesanan VARCHAR(20) 
);
CREATE TABLE tb_pembayaran (
    id_pembayaran VARCHAR(50) PRIMARY KEY,
    id_pemesanan VARCHAR(50) REFERENCES tb_pemesanan(id_pemesanan),
    metode VARCHAR(50),
    status VARCHAR(20),
    tgl_bayar TIMESTAMP,
    total_bayar DECIMAL(10, 2)
);
CREATE TABLE tb_tiket (
    id_tiket VARCHAR(50) PRIMARY KEY,
    id_pemesanan VARCHAR(50) REFERENCES tb_pemesanan(id_pemesanan),
    id_jadwal VARCHAR(50) REFERENCES tb_jadwal(id_jadwal),
    id_kursi VARCHAR(50) REFERENCES tb_kursi(id_kursi),
    kode_tiket VARCHAR(50) UNIQUE NOT NULL,
    tanggal_cetak TIMESTAMP,
    harga DECIMAL(10, 2),
    status VARCHAR(20)
);
CREATE TABLE tb_detail_produk (
    id_detail VARCHAR(50) PRIMARY KEY,
    id_pemesanan VARCHAR(50) REFERENCES tb_pemesanan(id_pemesanan),
    id_produk VARCHAR(50) REFERENCES tb_produk(id_produk),
    qty INT,
    subtotal DECIMAL(10, 2)
);
