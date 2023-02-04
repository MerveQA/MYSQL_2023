-- 31 OCAK SALI 2023

CREATE DATABASE FSAE02;

USE FSAE02;


CREATE TABLE ogrenciler
( 
id int, 
isim varchar(50), 
adres varchar(100),
sinav_notu int
);

-- drop table ogrenciler;



insert into ogrenciler (id, isim, adres, sinav_notu)
values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(123, 'Derya Soylu', 'İstanbul', 95);
insert into ogrenciler (id, isim, adres, sinav_notu)
values(124, 'Yavuz Bal', 'Ankara', 80);

select * from ogrenciler;

-- WHERE
/*
SELECT *
FROM tablo adı
WHERE koşul
*/
/*
SORU 1) Sınav notu 80'den büyük olan öğrencilerin bilgilerini listele
*/

SELECT id, isim, adres, sinav_notu
FROM ogrenciler
WHERE sinav_notu > 80;


/*
SORU 2) Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
*/

select isim, adres 
from ogrenciler 
where adres = 'Ankara';


/*
SORU 3) id’si 124 olan öğrencinin tüm bilgilerini listele
*/


select *
from ogrenciler
where id = 124;


/*
SORU 4) id’si 121 olan öğrencinin adres ve sinav notunu listele
*/


SELECT adres, sinav_notu
FROM ogrenciler
WHERE id = 121;


create table personel
(
id char(4),
isim varchar(40),
maas int
);


insert into personel values('1001', 'Ali Can', '70000');
insert into personel values('1002', 'Veli Mert','85000');
insert into personel values('1003', 'Ayşe Tan', '65000');
insert into personel values('1004', 'Derya Soylu', '95000');
insert into personel values('1005', 'Yavuz Bal', '80000');
insert into personel values('1006', 'Sena Beyaz', '100000');


select * from personel;

-- AND
/*
Belirtilen şartların her ikisi de gerçekleşiyorsa o kayıt listelenir.
Bir tanesi gerçekleşmez ise listelenmez.
*/


/*
SORU 5) Maaşı 65000 ile 90000 arasında olan persollerin listesi
*/
select *
from personel
where maas > 65000 and maas < 90000;


-- OR
/*
Belirtilen şartlardan biri gerçekleşiyorsa o kayıt listelenir.
Hiç biri gerçekleşmez ise listelenmez.
*/


/*
SORU 6) Ali Can ın ve maaşı 80000 den büyük olanların bilgilerini listele
*/


SELECT *
FROM personel
WHERE isim = 'Ali Can' OR maas > 80000;

-- BETWEEN

SELECT *
FROM personel
WHERE maas BETWEEN 65000 AND 70000;


SELECT *
FROM personel
WHERE maas >= 65000 AND maas <= 70000;


/*
SORU 7) id'si 1002 ile 1005 arasında olan personel bilgilerini listele
*/


select * 
from personel 
where id between 1002 and 1005;


/*
SORU 8) Derya Soylu ile Yavuz Bal arasındaki personel bilgilerini listele
*/


SELECT *
FROM personel
WHERE isim BETWEEN 'Derya Soylu' AND 'Yavuz Bal';


/*
SORU 9) id'si 1001, 1002 ve 1004 olan personel bilgilerini listele
*/
select *
from personel 
where id = 1001 or id = 1002 or id = 1004;


/*
SORU 10) Maaşı sadece 70000 veya 100000 olan personelleri listele
*/

SELECT *
FROM personel
WHERE maas = 70000 OR maas = 100000;

