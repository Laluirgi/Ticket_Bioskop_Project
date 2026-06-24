-- =====================================================
-- QUERY SISTEM TIKET BIOSKOP
-- =====================================================

-- =====================================================
-- 1. MENAMPILKAN SEMUA FILM
-- (Movies Page)
-- =====================================================

SELECT *
FROM tb_film
ORDER BY judul;

-- =====================================================
-- 2. MENAMPILKAN FILM BERDASARKAN GENRE
-- =====================================================

SELECT *
FROM tb_film
WHERE genre = 'Action';

-- =====================================================
-- 3. MENAMPILKAN DETAIL FILM DAN JADWAL
-- (Detail Film Page)
-- =====================================================

SELECT
    f.judul,
    f.genre,
    f.durasi,
    f.rating_usia,
    j.tanggal_tayang,
    j.jam_tayang,
    s.nama_studio,
    j.harga_tiket
FROM tb_jadwal j
INNER JOIN tb_film f
    ON j.id_film = f.id_film
INNER JOIN tb_studio s
    ON j.id_studio = s.id_studio
ORDER BY j.tanggal_tayang, j.jam_tayang;

-- =====================================================
-- 4. MENAMPILKAN JADWAL FILM TERTENTU
-- =====================================================

SELECT
    f.judul,
    j.tanggal_tayang,
    j.jam_tayang,
    s.nama_studio,
    j.harga_tiket
FROM tb_jadwal j
JOIN tb_film f
    ON j.id_film = f.id_film
JOIN tb_studio s
    ON j.id_studio = s.id_studio
WHERE f.judul = 'Avengers';

-- =====================================================
-- 5. MENAMPILKAN KURSI TERSEDIA
-- (Pilih Kursi)
-- =====================================================

SELECT
    id_kursi,
    baris,
    nomor,
    status_kursi
FROM tb_kursi
WHERE status_kursi = 'AVAILABLE'
ORDER BY baris, nomor;

-- =====================================================
-- 6. MENAMPILKAN KURSI YANG SUDAH DIBOOKING
-- =====================================================

SELECT
    id_kursi,
    baris,
    nomor
FROM tb_kursi
WHERE status_kursi = 'BOOKED';

-- =====================================================
-- 7. MENAMPILKAN DATA PROFIL USER
-- (Profil Page)
-- =====================================================

SELECT
    nama_pelanggan,
    email,
    no_hp,
    alamat
FROM tb_pelanggan
WHERE id_pelanggan = 1;

-- =====================================================
-- 8. MENAMPILKAN DATA PEMESANAN USER
-- (Riwayat)
-- =====================================================

SELECT
    p.id_pemesanan,
    pl.nama_pelanggan,
    p.total_harga,
    p.status_pemesanan,
    p.tanggal_pesan
FROM tb_pemesanan p
JOIN tb_pelanggan pl
    ON p.id_pelanggan = pl.id_pelanggan
ORDER BY p.tanggal_pesan DESC;

-- =====================================================
-- 9. MENAMPILKAN DETAIL TRANSAKSI
-- (Checkout)
-- =====================================================

SELECT
    pl.nama_pelanggan,
    f.judul,
    s.nama_studio,
    j.tanggal_tayang,
    j.jam_tayang,
    k.baris,
    k.nomor,
    p.total_harga
FROM tb_pemesanan p
JOIN tb_pelanggan pl
    ON p.id_pelanggan = pl.id_pelanggan
JOIN tb_detail_pemesanan dp
    ON p.id_pemesanan = dp.id_pemesanan
JOIN tb_jadwal j
    ON dp.id_jadwal = j.id_jadwal
JOIN tb_film f
    ON j.id_film = f.id_film
JOIN tb_studio s
    ON j.id_studio = s.id_studio
JOIN tb_kursi k
    ON dp.id_kursi = k.id_kursi;

-- =====================================================
-- 10. MENAMPILKAN TIKET SAYA
-- (Tiket Saya)
-- =====================================================

SELECT
    t.kode_tiket,
    f.judul,
    s.nama_studio,
    j.tanggal_tayang,
    j.jam_tayang,
    CONCAT(k.baris, k.nomor) AS kursi,
    t.status_tiket
FROM tb_tiket t
JOIN tb_detail_pemesanan dp
    ON t.id_detail = dp.id_detail
JOIN tb_jadwal j
    ON dp.id_jadwal = j.id_jadwal
JOIN tb_film f
    ON j.id_film = f.id_film
JOIN tb_studio s
    ON j.id_studio = s.id_studio
JOIN tb_kursi k
    ON dp.id_kursi = k.id_kursi;

-- =====================================================
-- 11. COUNT JUMLAH FILM
-- =====================================================

SELECT COUNT(*) AS jumlah_film
FROM tb_film;

-- =====================================================
-- 12. COUNT JUMLAH PELANGGAN
-- =====================================================

SELECT COUNT(*) AS jumlah_pelanggan
FROM tb_pelanggan;

-- =====================================================
-- 13. GROUP BY GENRE FILM
-- =====================================================

SELECT
    genre,
    COUNT(*) AS jumlah_film
FROM tb_film
GROUP BY genre;

-- =====================================================
-- 14. GROUP BY STATUS PEMBAYARAN
-- =====================================================

SELECT
    status_pembayaran,
    COUNT(*) AS total_transaksi
FROM tb_pembayaran
GROUP BY status_pembayaran;

-- =====================================================
-- 15. LEFT JOIN
-- =====================================================

SELECT
    pl.nama_pelanggan,
    p.id_pemesanan
FROM tb_pelanggan pl
LEFT JOIN tb_pemesanan p
    ON pl.id_pelanggan = p.id_pelanggan;

-- =====================================================
-- 16. RIGHT JOIN
-- =====================================================

SELECT
    pl.nama_pelanggan,
    p.id_pemesanan
FROM tb_pelanggan pl
RIGHT JOIN tb_pemesanan p
    ON pl.id_pelanggan = p.id_pelanggan;

-- =====================================================
-- 17. SINGLE ROW SUBQUERY
-- Film dengan durasi di atas rata-rata
-- =====================================================

SELECT
    judul,
    durasi
FROM tb_film
WHERE durasi >
(
    SELECT AVG(durasi)
    FROM tb_film
);

-- =====================================================
-- 18. MULTI ROW SUBQUERY
-- Pelanggan yang pernah memesan tiket
-- =====================================================

SELECT
    nama_pelanggan
FROM tb_pelanggan
WHERE id_pelanggan IN
(
    SELECT id_pelanggan
    FROM tb_pemesanan
);

-- =====================================================
-- 19. UPDATE STATUS PEMBAYARAN
-- =====================================================

UPDATE tb_pembayaran
SET status_pembayaran = 'BERHASIL'
WHERE id_pembayaran = 3;

-- =====================================================
-- 20. DELETE DATA TIKET
-- =====================================================

DELETE FROM tb_tiket
WHERE id_tiket = 5;
