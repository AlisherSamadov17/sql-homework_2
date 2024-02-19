create table countries(
    id uuid primary key,
    name varchar(40)
);

create table cities(
    id uuid primary key,
    name varchar(40),
    country_id uuid references countries(id)
);

insert into countries values('f4435666-cf0a-11ee-bac6-57175b04554a','Uzbekistan');
insert into countries values('cd9eec64-cf0a-11ee-b687-2b8bc71ed113','France');


-- France
insert into cities values('7d724168-cf0b-11ee-a22b-b311614c939f','Lyon','cd9eec64-cf0a-11ee-b687-2b8bc71ed113'),
('8b5f3f42-cf0b-11ee-82b0-6b111c995e5b','Marsel','cd9eec64-cf0a-11ee-b687-2b8bc71ed113'),
('b4eb8276-cf0b-11ee-9eed-ffe746a7140f','Nants','cd9eec64-cf0a-11ee-b687-2b8bc71ed113'),
('d66ee42e-cf0b-11ee-aadc-ef3b8cdca178','Lille','cd9eec64-cf0a-11ee-b687-2b8bc71ed113');

-- Uzbekistan
insert into cities values('7869bc04-cf0c-11ee-9cd0-03dc4af88dbc','Toshkent','f4435666-cf0a-11ee-bac6-57175b04554a'),
('8e23981c-cf0c-11ee-a3ec-4f6f89756052','Samarqand','f4435666-cf0a-11ee-bac6-57175b04554a'),
('c4f9253c-cf0c-11ee-8b8b-df11aa97c69f','Sirdaryo','f4435666-cf0a-11ee-bac6-57175b04554a'),
('e0a55e5e-cf0c-11ee-9591-6f010d797a3b','Buxaro','f4435666-cf0a-11ee-bac6-57175b04554a');

-- queary pracitce
select * from cities;
select AVG(LENGTH(name)) from cities;
select count(name) from cities;
select name from cities where country_id = 'cd9eec64-cf0a-11ee-b687-2b8bc71ed113'
select * from cities where name like 'A%';

-- advanced concepts;
alter table cities add column population integer;

-- ------------------------------------------------
UPDATE cities
SET population = 1000000
WHERE name = 'Parij';

UPDATE cities
SET population = 123456
WHERE name = 'Sirdaryo';
-- qolgan hammasiga ham population set qilingan
------------------------------------------------

select sum(population) from cities;

update cities set name = 'Xorazm',population = 20000 where id = 'c4f9253c-cf0c-11ee-8b8b-df11aa97c69f';

delete from cities where population < 100000;


-- timestamp and functions;
-- ----------------------------------------------
alter table cities add column created_at TIMESTAMP;
insert into cities values('f4e30950-cf13-11ee-b9ac-bbd24b873d9d','Parij','cd9eec64-cf0a-11ee-b687-2b8bc71ed113',210000,now())
-- ----------------------------------------------

update cities set created_at = '2024-02-18 15:23:23.76543' where name='Parij';