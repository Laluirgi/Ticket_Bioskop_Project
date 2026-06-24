INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, email, no_hp, alamat, password) 
VALUES ('PLG-01', 'User Baru', 'user@email.com', '08123456', 'Jl. Mawar', 'password123');

SELECT * FROM tb_pelanggan 
WHERE email = 'user@email.com' AND password = 'password123';

SELECT COUNT(*) AS total_movies FROM tb_film;

SELECT COUNT(*) AS total_studios FROM tb_studio;

SELECT COUNT(*) AS total_tickets_sold FROM tb_tiket;

SELECT 
    f.id_film,
    f.judul, 
    f.genre, 
    f.poster,
    STRING_AGG(TO_CHAR(j.jam_tayang, 'HH24:MI'), ' | ' ORDER BY j.jam_tayang) AS daftar_jam_tayang
FROM tb_film f
JOIN tb_jadwal j ON f.id_film = j.id_film
WHERE j.tanggal = CURRENT_DATE
GROUP BY f.id_film, f.judul, f.genre, f.poster
ORDER BY f.id_film;
