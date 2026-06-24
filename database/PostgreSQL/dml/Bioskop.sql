-- =====================================================
-- DML SISTEM TIKET BIOSKOP
-- =====================================================

-- =====================================================
-- DATA PELANGGAN
-- =====================================================

INSERT INTO tb_pelanggan
(nama_pelanggan, email, no_hp, alamat, password)
VALUES
('Budi Santoso', 'budi@gmail.com', '081234567890', 'Jl. Soekarno-Hatta No.01 Malang', 'budi123'),
('Siti Rahma', 'siti@gmail.com', '081234567891', 'Jl. Basuki Rahmat No.02 Malang', 'siti123'),
('Andi Saputra', 'andi@gmail.com', '081234567892', Jl. Ahmad Yani No.03 Surabaya', 'andi123'),
('Dewi Lestari', 'dewi@gmail.com', '081234567893', 'Jl. Panglima Sudirman No.04 Surabaya', 'dewi123'),
('Rizky Pratama', 'rizky@gmail.com', '081234567894', 'Jl. Tunjungan No.05 Surabaya', 'rizky123');

-- =====================================================
-- DATA FILM
-- =====================================================

INSERT INTO tb_film
(judul, genre, durasi, rating_usia, sinopsis, poster)
VALUES
INSERT INTO tb_film
(judul, genre, durasi, rating_usia, sinopsis, poster)
VALUES

('Avengers', 'Action', 180, '13+',
'Ancaman terbesar dalam sejarah multiverse telah muncul. Para Avengers lama dan baru harus bersatu untuk menghadapi Doctor Doom yang memiliki kekuatan luar biasa untuk mengubah realitas. Nasib seluruh alam semesta bergantung pada satu pertempuran terakhir yang akan menentukan masa depan dunia.',
'avengers.jpg'),

('Avengers Secret Wars', 'Action', 190, '13+',
'Pertempuran besar multiverse dalam Secret Wars.',
'avengers_secret_wars.jpg'),

('Batman', 'Action', 175, '13+',
'Batman menjaga keamanan Gotham City.',
'batman.jpg'),

('Frozen', 'Animation', 120, 'SU',
'Petualangan Elsa dan Anna di kerajaan Arendelle.',
'frozen.jpg'),

('Minion', 'Animation', 110, 'SU',
'Kevin, Stuart, dan Bob kembali dalam petualangan baru yang membawa mereka ke dunia monster yang penuh kejutan. Ketika sebuah kekuatan misterius mengancam Monster City, para Minions harus bekerja sama dengan para monster untuk menyelamatkan kota dan menemukan arti persahabatan sejati.',
'minion.jpg'),

('Shrek', 'Animation', 130, 'SU',
'Petualangan Shrek bersama teman-temannya.',
'sherk.jpg'),

('Spiderman', 'Action', 150, '13+',
'Menceritakan kehidupan Peter Parker empat tahun setelah dunia melupakan identitasnya di akhir peristiwa No Way Home. Peter hidup sebatang kara dan memutuskan untuk mengabdikan dirinya sebagai Spider-Man sepenuhnya. Tekanan mental akibat kesepian tersebut memicu perubahan fisik yang mengancam keberadaannya. Situasi ini semakin rumit ketika muncul ancaman penjahat baru yang sangat kuat namun tidak terlihat oleh siapa pun.',
'spiderman.jpg'),

('Toy Story', 'Animation', 115, 'SU',
'Woody, Buzz Lightyear, Jessie, dan teman-teman lainnya menghadapi tantangan baru ketika teknologi modern mulai menggantikan permainan tradisional. Mereka harus menemukan tempat mereka di dunia yang terus berubah sambil menjaga ikatan persahabatan yang telah terbentuk selama bertahun-tahun.',
'toy_story.jpg');

-- =====================================================
-- DATA STUDIO
-- =====================================================

INSERT INTO tb_studio
(nama_studio, kapasitas)
VALUES
('Studio 1', 24),
('Studio 2', 24),
('Studio 3', 24);

-- =====================================================
-- DATA JADWAL
-- =====================================================

INSERT INTO tb_jadwal
(id_film, id_studio, tanggal_tayang, jam_tayang, harga_tiket)
VALUES
(1, 1, '2026-07-01', '13:00:00', 50000),
(1, 1, '2026-07-01', '19:00:00', 50000),

(2, 2, '2026-07-01', '14:00:00', 45000),
(2, 2, '2026-07-01', '20:00:00', 45000),

(3, 3, '2026-07-01', '10:00:00', 40000),
(4, 3, '2026-07-01', '15:00:00', 40000),
(5, 2, '2026-07-01', '17:00:00', 45000);

-- =====================================================
-- DATA KURSI STUDIO 1
-- =====================================================

INSERT INTO tb_kursi (id_studio, baris, nomor, status_kursi)
VALUES
(1,'A',1,'AVAILABLE'),
(1,'A',2,'AVAILABLE'),
(1,'A',3,'AVAILABLE'),
(1,'A',4,'BOOKED'),
(1,'A',5,'AVAILABLE'),
(1,'A',6,'AVAILABLE'),

(1,'B',1,'AVAILABLE'),
(1,'B',2,'BOOKED'),
(1,'B',3,'AVAILABLE'),
(1,'B',4,'AVAILABLE'),
(1,'B',5,'AVAILABLE'),
(1,'B',6,'AVAILABLE'),

(1,'C',1,'AVAILABLE'),
(1,'C',2,'AVAILABLE'),
(1,'C',3,'AVAILABLE'),
(1,'C',4,'AVAILABLE'),
(1,'C',5,'BOOKED'),
(1,'C',6,'AVAILABLE'),

(1,'D',1,'AVAILABLE'),
(1,'D',2,'AVAILABLE'),
(1,'D',3,'AVAILABLE'),
(1,'D',4,'AVAILABLE'),
(1,'D',5,'AVAILABLE'),
(1,'D',6,'AVAILABLE');

-- =====================================================
-- DATA KURSI STUDIO 2
-- =====================================================

INSERT INTO tb_kursi (id_studio, baris, nomor, status_kursi)
VALUES
(2,'A',1,'AVAILABLE'),
(2,'A',2,'AVAILABLE'),
(2,'A',3,'AVAILABLE'),
(2,'A',4,'AVAILABLE'),
(2,'A',5,'AVAILABLE'),
(2,'A',6,'AVAILABLE'),

(2,'B',1,'AVAILABLE'),
(2,'B',2,'AVAILABLE'),
(2,'B',3,'AVAILABLE'),
(2,'B',4,'AVAILABLE'),
(2,'B',5,'AVAILABLE'),
(2,'B',6,'AVAILABLE'),

(2,'C',1,'AVAILABLE'),
(2,'C',2,'AVAILABLE'),
(2,'C',3,'AVAILABLE'),
(2,'C',4,'AVAILABLE'),
(2,'C',5,'AVAILABLE'),
(2,'C',6,'AVAILABLE'),

(2,'D',1,'AVAILABLE'),
(2,'D',2,'AVAILABLE'),
(2,'D',3,'AVAILABLE'),
(2,'D',4,'AVAILABLE'),
(2,'D',5,'AVAILABLE'),
(2,'D',6,'AVAILABLE');

-- =====================================================
-- DATA KURSI STUDIO 3
-- =====================================================

INSERT INTO tb_kursi (id_studio, baris, nomor, status_kursi)
VALUES
(3,'A',1,'AVAILABLE'),
(3,'A',2,'AVAILABLE'),
(3,'A',3,'AVAILABLE'),
(3,'A',4,'AVAILABLE'),
(3,'A',5,'AVAILABLE'),
(3,'A',6,'AVAILABLE'),

(3,'B',1,'AVAILABLE'),
(3,'B',2,'AVAILABLE'),
(3,'B',3,'AVAILABLE'),
(3,'B',4,'AVAILABLE'),
(3,'B',5,'AVAILABLE'),
(3,'B',6,'AVAILABLE'),

(3,'C',1,'AVAILABLE'),
(3,'C',2,'AVAILABLE'),
(3,'C',3,'AVAILABLE'),
(3,'C',4,'AVAILABLE'),
(3,'C',5,'AVAILABLE'),
(3,'C',6,'AVAILABLE'),

(3,'D',1,'AVAILABLE'),
(3,'D',2,'AVAILABLE'),
(3,'D',3,'AVAILABLE'),
(3,'D',4,'AVAILABLE'),
(3,'D',5,'AVAILABLE'),
(3,'D',6,'AVAILABLE');

-- =====================================================
-- DATA PEMESANAN
-- =====================================================

INSERT INTO tb_pemesanan
(id_pelanggan, total_harga, status_pemesanan)
VALUES
(1, 150000, 'SELESAI'),
(2, 100000, 'SELESAI'),
(3, 50000, 'MENUNGGU');

-- =====================================================
-- DETAIL PEMESANAN
-- MULTI-SEAT BOOKING
-- =====================================================

INSERT INTO tb_detail_pemesanan
(id_pemesanan, id_jadwal, id_kursi)
VALUES

(1, 1, 1),
(1, 1, 2),
(1, 1, 3),

(2, 2, 5),
(2, 2, 6),

(3, 3, 25);

-- =====================================================
-- PEMBAYARAN
-- =====================================================

INSERT INTO tb_pembayaran
(id_pemesanan, metode_pembayaran, total_bayar, status_pembayaran, tanggal_bayar)
VALUES
(1, 'QRIS', 150000, 'BERHASIL', CURRENT_TIMESTAMP),

(2, 'Transfer Bank', 100000, 'BERHASIL', CURRENT_TIMESTAMP),

(3, 'E-Wallet', 50000, 'MENUNGGU', NULL);

-- =====================================================
-- TIKET
-- =====================================================

INSERT INTO tb_tiket
(id_detail, kode_tiket, status_tiket)
VALUES
(1, 'TKT-001', 'AKTIF'),
(2, 'TKT-002', 'AKTIF'),
(3, 'TKT-003', 'AKTIF'),
(4, 'TKT-004', 'AKTIF'),
(5, 'TKT-005', 'AKTIF');
