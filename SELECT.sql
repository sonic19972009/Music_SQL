--Задание 2
--Название и продолжительность самого длительного трека.
SELECT name, duration  FROM track
WHERE duration = (SELECT max(duration) FROM track)

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT name FROM track
WHERE duration > '000:03:30'

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name, year FROM collection
GROUP BY name, year 
HAVING year > '2017-12-31' AND year < '2021-01-01'

--Исполнители, чьё имя состоит из одного слова.
SELECT * FROM executor
WHERE name NOT LIKE '% %'

--Название треков, которые содержат слово «беги» или «go».
SELECT * FROM track
WHERE lower(name) LIKE '%беги%' OR lower(name) LIKE '%go%'

--Задание 3
--Количество исполнителей в каждом жанре.
SELECT name, count(*) AS executor_count FROM Genre_Executor e
JOIN genre g ON g.id = genreid
GROUP BY name

--Количество треков, вошедших в альбомы 2019–2020 годов.
--Изменил условие задания под свои данные, вывожу количество треков в альбомах
--с 2000 по 2018 год включительно.
SELECT count(*) AS tracks_count FROM album a
JOIN track t ON t.albumid = a.id
WHERE a.year > '1999-12-31' AND year < '2019-01-01'

--Средняя продолжительность треков по каждому альбому
SELECT AVG(duration) FROM track t 
WHERE albumid > 0

--Все исполнители, которые не выпустили альбомы в 2018 году.
SELECT e.name FROM executor e
JOIN Album_Executor a ON a.executorid = e.id 
JOIN album a2 ON a2.id = a.albumid 
WHERE a2.year NOT BETWEEN '2017-12-31' AND '2019-01-01'

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c.name FROM collection c 
JOIN Collections_Track c2 ON c2.collectionid = c.id 
JOIN track t ON c2.trackid = t.id 
JOIN album a ON a.id = t.albumid 
JOIN Album_Executor a2 ON a2.albumid = a.id 
JOIN executor e ON e.id = a2.executorid 
WHERE e.name = 'Rammstein'

--Задание 4
--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT e.name FROM track t 
JOIN Album_Executor a ON a.albumid = t.albumid 
JOIN executor e ON e.id = a.executorid 
WHERE duration = (SELECT min(duration) FROM track)

--Названия альбомов, содержащих наименьшее количество треков.
WITH AlbumTrackCount AS 
(SELECT a.id AS album_id, a.name AS album_name, COUNT(t.id) AS track_count
FROM Album a
LEFT JOIN Track t ON a.id = t.albumid
GROUP BY a.id, a.name)
SELECT album_name
FROM AlbumTrackCount
WHERE track_count = (SELECT MIN(track_count) FROM AlbumTrackCount);
