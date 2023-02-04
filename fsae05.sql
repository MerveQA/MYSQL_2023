-- 3 SUBAT CUMA / 2023

use fsae04;

-- SET SQL_SAFE_UPDATES = 0
-- 0 oldugunda safe modu kapatır
-- 1 oldugunda safe modu acar 

 CREATE TABLE ogrenciler
 ( 
 id char(3), 
 isim varchar(50),
 veli_isim varchar(50), 
 yazili_notu int, 
 CONSTRAINT ogrenciler_pk PRIMARY KEY (id) );
 
INSERT INTO ogrenciler
VALUES(123, 'Ali Can', "Hasan",75);
INSERT INTO ogrenciler 
VALUES (124, 'Merve Gul', "Ayse",85);
INSERT INTO ogrenciler
VALUES (125, 'Kemal Yasa', 'Hasan',85);

SELECT * FROM ogrenciler;

DELETE FROM ogrenciler;
-- Tabloyu silmez , içindeki dataları siler

DROP TABLE ogrenciler;
-- Tabloyu dataları ile beraber toptan siler

-- İsmi AliCan olanları silelim
-- silmeden once tedbiren datayı görmekte fayda .. sonrasnda silme işlemi yapılabilir
SELECT * FROM ogrenciler
WHERE isim = 'Ali Can';
DELETE FROM ogrenciler
WHERE isim = 'Ali Can';

-- Notu 85 olanları silelim
-- silmeden once tedbiren datayı görmekte fayda .. sonrasnda silme işlemi yapılabilir
SELECT * FROM ogrenciler 
WHERE yazili_notu = 85;
DELETE FROM ogrenciler 
WHERE yazili_notu = 85;

-- İsmi Ali Can olanı OR Veli ismi Ayse olanı silelim
-- İkisinide silelim
-- silmeden once tedbiren datayı görmekte fayda .. sonrasnda silme işlemi yapılabilir
SELECT * FROM ogrenciler
WHERE isim = 'Ali Can'OR veli_isim = 'Ayse';
DELETE FROM ogrenciler
WHERE isim = 'Ali Can'OR veli_isim = 'Ayse';

CREATE TABLE calisanlar (
id char(9),
isim varchar(30),
soyisim varchar(40),
email varchar(40),
ise_baslama_tarihi DATE,
is_unvani varchar(20),
maas int,
CONSTRAINT calisanlar_pk PRIMARY KEY(id)
);


INSERT INTO calisanlar VALUES(123456789,"Ali","Can","alican@gmail.com","2010-04-10","isci",5000);
INSERT INTO calisanlar VALUES(123456788,"Veli","CEM","velicem@gmail.com","2012-01-10","isci",5500);
INSERT INTO calisanlar VALUES(123456777,"AYSE","GUL","aysegul@gmail.com","2014-05-01","MUHASEBECI",4500);
INSERT INTO calisanlar VALUES(123456987,"Fatma","YASA","fatmayasa@gmail.com","2009-04-10","MUHENDIS",7500);
 
 SELECT * FROM calisanlar;
 
 -- Muhendisin maasını 7000 yapın
 UPDATE calisanlar
 SET maas = 7000
 WHERE is_unvani = "MUHENDİS";
 
 -- Muhasebecinin ismini Sena Ssoyismini YILMAZ yapin 
 UPDATE calisanlar
 SET isim = "SENA" and soyisim = "YILMAZ"
 WHERE is_unvani = "MUHASEBECI";
 
 -- Maası 5000 den buyuk olanları silelim
 DELETE FROM calisanlar
 WHERE maas > 5000;
 
TRUNCATE TABLE calisanlar;
-- Delete den farkı --> delete de bir kayıdı sildiginizde loglardam bir sekilde zor da 
-- olsa getirilebilir. Truncate de izleri bile siliniyor gerı getiremiyoruz.
-- Tablo durur ama veriler gider..
-- Drop hem tabloyu hem de dataları gerı donussuz siler 


/*
ALTER TABLE
*/

CREATE TABLE personel
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
sirket VARCHAR(20)
);

SELECT * FROM personel;

-- SORU1: personel tablosuna ulke_isim adinda yeni bir sutun ekleyiniz.

ALTER TABLE personel
ADD ulke_isim VARCHAR(40);

insert into personel (id, isim, sehir, maas, sirket, ulke_isim)
values (1, 'Murat', 'İstanbul', 5750, 'Finans', 'Türkiye');

insert into personel (id, isim, sehir, maas, sirket, ulke_isim)
values (2, null, null, null, null, null);


-- SORU1A: personel tablosuna ulke_isim adinda ve 
-- default degeri 'Türkiye' olan yeni bir sutun ekleyiniz.

ALTER TABLE personel
DROP COLUMN ulke_isim;

ALTER TABLE personel
ADD ulke_isim VARCHAR(40) DEFAULT 'Türkiye';

insert into personel (id, isim, sehir, maas, sirket, ulke_isim)
values (3, null, null, null, null, null);
​
insert into personel (id, isim, sehir, maas, sirket)
values (4, null, null, null, null);

insert into personel (id)
values (5);

ALTER TABLE personel
MODIFY COLUMN ulke_isim VARCHAR(50);

-- cinsiyet sutunu ekleyiniz
alter table personel 
add cinsiyet char(1);


-- cinsiyet sutunu default 'E' olarak ekleyiniz
ALTER TABLE personel
DROP COLUMN cinsiyet;

ALTER TABLE personel
ADD cinsiyet CHAR(1) DEFAULT 'E';

-- personel tablosundan sirket sutununu siliniz.
ALTER TABLE personel
DROP COLUMN sirket;

ALTER TABLE personel
ADD dogum_tarihi date;

update personel
set dogum_tarihi = '2000-01-01';

ALTER TABLE personel
MODIFY COLUMN dogum_tarihi DATE NOT NULL;

SELECT 1 AS SAYI;

SELECT 1 + 1 AS TOPLAM;

SELECT 1 + 1.0 AS TOPLAM;

SELECT now() AS Tarih_Saat;

SELECT CONCAT('Ali', ' ', 'Veli') AS 'Ad Soyad';

CREATE TABLE ogrenciler
(
id CHAR(3),
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan', 75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse', 85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan', 85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse', 95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can', 99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

-- SORU1: id 124 olan ogrenciyi siliniz.
delete from ogrenciler where id = 124;

-- SORU2: İsmi Kemal Yasa olan satırı siliniz.
DELETE FROM ogrenciler WHERE isim = 'Kemal Yasa';

-- SORU3: İsmi Nesibe Yilmaz veya Mustafa Bak olan kayıtları siliniz.
DELETE FROM ogrenciler
WHERE isim = 'Nesibe Yilmaz' or isim = 'Mustafa Bak';

DELETE FROM ogrenciler
WHERE isim IN ('Nesibe Yilmaz', 'Mustafa Bak');

DELETE FROM ogrenciler
WHERE (isim = 'Nesibe Yilmaz') | (isim = 'Mustafa Bak');

-- SORU4: İsmi Ali Can ve id'si 123 olan kaydı siliniz.
DELETE FROM ogrenciler WHERE isim = 'Ali Can' AND id = 123;

-- SORU5: id'si 126'dan büyük olan kayıtları siliniz.
delete from ogrenciler where id > 126;

-- SORU6: id'si 123, 125 veya 126 olanları siliniz.
delete from ogrenciler where id in (123, 125, 126);

-- SORU7: Tablodaki tüm kayıtları siliniz.
delete from ogrenciler;
drop table ogrenciler;
truncate table ogrenciler;

/*
SET autocommit = 0;
savepoint
rollback to
*/

SET autocommit = 0;

select * from ogrenciler;

savepoint abc;

delete from ogrenciler;

rollback to abc;