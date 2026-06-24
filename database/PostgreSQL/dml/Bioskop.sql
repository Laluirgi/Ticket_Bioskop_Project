INSERT INTO tb_studio (id_studio, nama_studio) VALUES 
('STD-01', 'Studio 1'),
('STD-02', 'Studio 2'),
('STD-03', 'Studio 3'),
('STD-04', 'Studio 4'),
('STD-05', 'Studio 5');

INSERT INTO tb_film (id_film, judul, genre, poster) VALUES 
('FLM-01', 'Spiderman: Brand New Day', 'Action, Adventure, Sci-Fi', 'assets/img/spiderman.jpg'),
('FLM-02', 'Minion & Monsters', 'Animation', 'assets/img/minion.jpg'),
('FLM-03', 'Toys Story 5', 'Animation', 'assets/img/toy_story.jpg'),
('FLM-04', 'Avengers: Domsday', 'Fantasy', 'assets/img/avengers.jpg');

INSERT INTO tb_jadwal (id_jadwal, id_film, id_studio, tanggal, jam_tayang) VALUES 
('JDW-01', 'FLM-01', 'STD-01', CURRENT_DATE, '10:00:00'),
('JDW-02', 'FLM-01', 'STD-01', CURRENT_DATE, '13:00:00'),
('JDW-03', 'FLM-01', 'STD-01', CURRENT_DATE, '16:00:00'),
('JDW-04', 'FLM-01', 'STD-01', CURRENT_DATE, '19:00:00'),

('JDW-05', 'FLM-02', 'STD-02', CURRENT_DATE, '13:00:00'),
('JDW-06', 'FLM-02', 'STD-02', CURRENT_DATE, '15:30:00'),
('JDW-07', 'FLM-02', 'STD-02', CURRENT_DATE, '18:00:00'),
('JDW-08', 'FLM-02', 'STD-02', CURRENT_DATE, '20:00:00'),

('JDW-09', 'FLM-03', 'STD-03', CURRENT_DATE, '10:00:00'),
('JDW-10', 'FLM-03', 'STD-03', CURRENT_DATE, '13:00:00'),
('JDW-11', 'FLM-03', 'STD-03', CURRENT_DATE, '16:00:00'),
('JDW-12', 'FLM-03', 'STD-03', CURRENT_DATE, '19:00:00'),

('JDW-13', 'FLM-04', 'STD-04', CURRENT_DATE, '11:00:00'),
('JDW-14', 'FLM-04', 'STD-04', CURRENT_DATE, '14:00:00'),
('JDW-15', 'FLM-04', 'STD-04', CURRENT_DATE, '17:00:00'),
('JDW-16', 'FLM-04', 'STD-04', CURRENT_DATE, '20:00:00');
