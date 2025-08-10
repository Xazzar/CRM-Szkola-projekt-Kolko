CREATE DATABASE IF NOT EXISTS KLUB_SPORTOWY
DEFAULT CHARACTER SET UTF8MB4
DEFAULT COLLATE utf8mb4_unicode_ci;

USE KLUB_SPORTOWY;

create table if not exists dzieci (
id int not null auto_increment,
imie varchar(50) not null,
data_urodzenia date,
primary key (id)
);

create table if not exists zajecia (
id int not null auto_increment,
nazwa varchar(50) not null,
primary key (id)
);

create table if not exists dziecko_zajecia (
dziecko_id int not null,
zajecia_id int not null,
oplacony_karnet boolean default false,
zapisano datetime default current_timestamp,
primary key (dziecko_id, zajecia_id),
foreign key (dziecko_id) references dzieci(id) on delete cascade on update cascade,
foreign key (zajecia_id) references zajecia(id) on delete cascade on update cascade
);
insert into dzieci (imie, data_urodzenia) values
('Kuba', '2012-05-10'),
('Ola', '2014-08-22'),
('Michał', '2013-03-14'),
('Zuzia', '2015-07-02'),
('Kacper', '2011-11-18'),
('Natalia', '2013-12-05'),
('Adam', '2012-02-20'),
('Julia', '2014-06-12'),
('Filip', '2013-09-30'),
('Maja', '2015-01-25'),
('Patryk', '2011-04-16'),
('Amelia', '2013-08-09'),
('Jakub', '2012-10-03'),
('Laura', '2014-11-22'),
('Tomek', '2013-05-29'),
('Emilia', '2015-03-14'),
('Bartek', '2011-12-10'),
('Kinga', '2013-07-07'),
('Mateusz', '2012-01-18'),
('Sandra', '2014-09-25'),
('Marcin', '2013-11-06'),
('Wiktoria', '2015-05-21'),
('Szymon', '2011-03-02'),
('Zofia', '2013-10-17'),
('Maciek', '2012-07-11'),
('Martyna', '2014-04-05'),
('Dominik', '2013-06-23'),
('Gabriela', '2015-08-12'),
('Sebastian', '2011-09-29'),
('Olga', '2013-01-15'),
('Łukasz', '2012-03-08'),
('Nikola', '2014-12-19'),
('Kamil', '2013-02-27'),
('Marta', '2015-06-03'),
('Igor', '2011-10-14'),
('Paulina', '2013-04-30'),
('Rafał', '2012-08-16'),
('Natalia', '2014-02-05'),
('Dawid', '2013-07-20'),
('Aleksandra', '2015-09-09'),
('Grzegorz', '2011-01-22'),
('Karolina', '2013-03-25'),
('Artur', '2012-11-12'),
('Magdalena', '2014-05-28'),
('Krzysztof', '2013-12-02'),
('Julia', '2015-10-18'),
('Marek', '2011-06-07'),
('Anna', '2013-09-13'),
('Paweł', '2012-04-04'),
('Ewa', '2014-07-30');

insert into zajecia (nazwa) values
('Tenis'),
('Piłka');

TRUNCATE TABLE dziecko_zajecia;


INSERT INTO dziecko_zajecia (dziecko_id, zajecia_id, oplacony_karnet) VALUES
(1, 1, TRUE),
(2, 2, FALSE),
(3, 1, TRUE),
(4, 2, FALSE),
(5, 1, TRUE),
(6, 2, TRUE),
(7, 1, FALSE),
(8, 2, TRUE),
(9, 1, TRUE),
(10, 2, FALSE),
(11, 1, TRUE),
(12, 2, TRUE),
(13, 1, FALSE),
(14, 2, TRUE),
(15, 1, TRUE),
(16, 2, FALSE),
(17, 1, TRUE),
(18, 2, TRUE),
(19, 1, FALSE),
(20, 2, TRUE),
(21, 1, TRUE),
(22, 2, FALSE),
(23, 1, TRUE),
(24, 2, TRUE),
(25, 1, FALSE),
(26, 2, TRUE),
(27, 1, TRUE),
(28, 2, FALSE),
(29, 1, TRUE),
(30, 2, TRUE),
(31, 1, FALSE),
(32, 2, TRUE),
(33, 1, TRUE),
(34, 2, FALSE),
(35, 1, TRUE),
(36, 2, TRUE),
(37, 1, FALSE),
(38, 2, TRUE),
(39, 1, TRUE),
(40, 2, FALSE),
(41, 1, TRUE),
(42, 2, TRUE),
(43, 1, FALSE),
(44, 2, TRUE),
(45, 1, TRUE),
(46, 2, FALSE),
(47, 1, TRUE),
(48, 2, TRUE),
(49, 1, FALSE),
(50, 2, TRUE);

SELECT d.imie, z.nazwa, 
       CASE WHEN dz.oplacony_karnet THEN 'Opłacony' ELSE 'Nieopłacony' END AS status_karnetu,
       DATE_FORMAT(dz.zapisano, '%Y-%m-%d %H:%i') AS data_zapisu
FROM dziecko_zajecia dz
JOIN dzieci d ON dz.dziecko_id = d.id
JOIN zajecia z ON dz.zajecia_id = z.id;


