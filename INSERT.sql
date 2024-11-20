--Имена групп/исполнителей
INSERT INTO executor (name)
VALUES ('Tardgrade Inferno'),
	   ('Обними Кита'),
	   ('Трибунал'),
	   ('Rammstein'),
	   ('Мёртыве Осы'),
       ('LaScala');
		
--Название жанров		
INSERT INTO genre (name)
VALUES ('Dark cabaret'),
       ('Rrock'),
       ('Metal'),
       ('Folk');
       
--Название альбомов       
INSERT INTO album (name, year)
VALUES ('Mastermind', '2019-01-18'),
	   ('Мой маяк', '2018-12-07'),
	   ('Время', '2018-04-22'),
       ('Кто я теперь?', '2020-12-20'),
       ('Sehnsucht', '1997-01-01'),
       ('Vol. 1', '2017-09-17');
	   
--Название треков
INSERT INTO track (name, duration, albumid)
VALUES ('We Are Number One', '00:02:26', 1),
	   ('Im Coming for Your Soul', '00:04:43', 1),
	   ('All Tardigrades Go to Hell', '00:02:58', 1),
	   ('Mastermind', '00:03:58', 1),
	   ('Execution is fun!', '00:03:27', NULL),
	   ('How Nightmares Die', '00:02:28', NULL),
	   ('Кило печенья', '00:03:02', 2),
	   ('Жизнь', '00:02:48', 2),
	   ('Миру нужен герой', '00:03:28', 2),
	   ('Моя Вторая Половина', '00:03:24', NULL),
	   ('Одинокая искра', '00:05:12', 3),
	   ('До конца!', '00:04:45', 3),
	   ('Беги Беги', '00:04:28', 3),
       ('Люди не люди', '00:03:48', 4),
       ('Нет времени для тебя', '00:03:54', 4),
       ('Жизни цель', '00:03:46', 4),
       ('Новый шанс', '00:03:36', 4),
       ('Sehnsucht', '00:04:22', 5),
       ('Du hast', '00:03:53', 5),
       ('Alter Mann', '00:04:24', 5),
       ('Spiel Mit Mir', '00:04:46', 5),
       ('Я буду твоим солнцем', '00:03:18', 6),
       ('Мёртвая 2.0', '00:02:52', 6),
       ('Контроль', '00:02:40', 6),
       ('Вне игры', '00:04:07', 6),
       ('Сутки', '00:03:57', NULL),
       ('RockStar', '00:03:39', NULL);

--Название коллекций	   
INSERT INTO collection (name, year)
VALUES ('Сборник 2020', '2020-01-01'),
	   ('Сборник 2021', '2021-01-01'),
	   ('Сборник 2022', '2022-01-01'),
	   ('Сборник 2023', '2023-01-01'),
       ('Без альбома', '2024-01-01');
	   
--Присоединение артистов к жанру	   
INSERT INTO genre_executor (genreid, executorid)
VALUES 
    (
        (SELECT id FROM genre WHERE name = 'Dark cabaret'),
        (SELECT id FROM executor WHERE name = 'Tardgrade Inferno')
    ),
    (
        (SELECT id FROM genre WHERE name = 'Folk'),
        (SELECT id FROM executor WHERE name = 'Обними Кита')
    ),
    (
        (SELECT id FROM genre WHERE name = 'Metal'),
        (SELECT id FROM executor WHERE name = 'Трибунал')
    ),
    (
        (SELECT id FROM genre WHERE name = 'Metal'),
        (SELECT id FROM executor WHERE name = 'Rammstein')
    ),
    (
        (SELECT id FROM genre WHERE name = 'Rrock'),
        (SELECT id FROM executor WHERE name = 'Мёртыве Осы')
    ),
    (
        (SELECT id FROM genre WHERE name = 'Rrock'),
        (SELECT id FROM executor WHERE name = 'LaScala')
    );
	   
--Присоединение артистов и альбомов	   
INSERT INTO album_executor (albumid, executorid)
VALUES 
    (
        (SELECT id FROM album WHERE name = 'Mastermind'),
        (SELECT id FROM executor WHERE name = 'Tardgrade Inferno')
    ),
    (
        (SELECT id FROM album WHERE name = 'Мой маяк'),
        (SELECT id FROM executor WHERE name = 'Обними Кита')
    ),
    (
        (SELECT id FROM album WHERE name = 'Время'),
        (SELECT id FROM executor WHERE name = 'Трибунал')
    ),
    (
        (SELECT id FROM album WHERE name = 'Кто я теперь?'),
        (SELECT id FROM executor WHERE name = 'Трибунал')
    ),
    (
        (SELECT id FROM album WHERE name = 'Sehnsucht'),
        (SELECT id FROM executor WHERE name = 'Rammstein')
    ),
    (
        (SELECT id FROM album WHERE name = 'Vol. 1'),
        (SELECT id FROM executor WHERE name = 'Мёртыве Осы')
    );
	   
--Присоединение названия треков и сборников	 
INSERT INTO collections_track (collectionid, trackid)
VALUES 
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2023'),
        (SELECT id FROM track WHERE name = 'Беги Беги')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2023'),
        (SELECT id FROM track WHERE name = 'Нет времени для тебя')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2023'),
        (SELECT id FROM track WHERE name = 'Жизни цель')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2023'),
        (SELECT id FROM track WHERE name = 'Новый шанс')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2022'),
        (SELECT id FROM track WHERE name = 'We Are Number One')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2022'),
        (SELECT id FROM track WHERE name = 'Im Coming for Your Soul')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2022'),
        (SELECT id FROM track WHERE name = 'All Tardigrades Go to Hell')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2022'),
        (SELECT id FROM track WHERE name = 'Mastermind')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2021'),
        (SELECT id FROM track WHERE name = 'Кило печенья')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2021'),
        (SELECT id FROM track WHERE name = 'Жизнь')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2021'),
        (SELECT id FROM track WHERE name = 'Миру нужен герой')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2020'),
        (SELECT id FROM track WHERE name = 'Sehnsucht')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2020'),
        (SELECT id FROM track WHERE name = 'Du hast')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2020'),
        (SELECT id FROM track WHERE name = 'Alter Mann')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Сборник 2020'),
        (SELECT id FROM track WHERE name = 'Spiel Mit Mir')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Без альбома'),
        (SELECT id FROM track WHERE name = 'Execution is fun!')
    ),
    (
        (SELECT id FROM collection WHERE name = 'Без альбома'),
        (SELECT id FROM track WHERE name = 'How Nightmares Die')
    );