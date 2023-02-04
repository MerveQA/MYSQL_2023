-- 1 SUBAT ÇARŞAMBA 2023

create database fsae03;
use fsae03;

-- UNIQUE: Bir sütundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar.
-- NOT NULL: Bir sütunun  NULL içermemesini, yani boş olmamasını sağlar.

create table ogrenciler
(
id int UNIQUE,
isim varchar(50) NOT NULL,
adres varchar(100),
sinav_notu int
);

insert into ogrenciler (id, isim, adres, sinav_notu) values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler (id, isim, adres, sinav_notu) values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler (id, isim, adres, sinav_notu) values(122, 'Ayse Tan', 'Bursa', 65);
insert into ogrenciler (id, isim, adres, sinav_notu) values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler (id, isim, adres, sinav_notu) values(124, 'Yavuz Bal', 'Ankara', 80);

insert into ogrenciler (id, isim, adres, sinav_notu) values(124, 'Yavuz Bal', 'Ankara', 80);
-- bu kodu ikinci defa eklemez cunku id unique oldugu icin ayni id ile tekrar ekleme yapamayiz

insert into ogrenciler (id, isim, adres, sinav_notu) values(125, 'Yavuz Bal', 'Ankara', 80);
-- id degistirince kayit yapabildik

insert into ogrenciler (id, isim, adres, sinav_notu) values(126, null, null, 80);
-- burada isim null deger alamayacagi icin kayit yapmaz
insert into ogrenciler (id, isim, adres, sinav_notu) values(126, 'Yavuz Bal', null, 80);
-- burada adres null deger alabilecegi icin kayit yapar
insert into ogrenciler (id, isim, sinav_notu) values(127, 'Yavuz Bal', 80);
-- burada adresi parantez icinden silip deger yazmayinca da null deger atayip kayit yapar​
insert into ogrenciler (id, isim, adres) values(128, 'Yavuz Bal', 80);
-- burada adrese int deger yazdik sayiyi kabul etti
insert into ogrenciler (id, isim, sinav_notu) values(129, 'Yavuz Bal', '70');
-- burada sinav_notu`nu tirnak icerisinde yazdik kabul etti
insert into ogrenciler (id, isim, adres, sinav_notu) values(null, 'Yavuz Bal', 'Ankara', 80);
-- unique alana sinirsiz null deger atayabiliriz. null bir deger ifade etmedigi icin unique olarak degerlendirmez
select * 
from ogrenciler;

/*  ##### TABLO 2 #####  */

-- PRIMARY KEY
/*
Bir sütünün NULL içermemesini ve 
sütundaki verilerin BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
*/

-- FOREIGN KEY
/*
Başka bir tablodaki Primary Key’i referans göstermek için kullanılır.
Böylelikle, tablolar arasında ilişki kurulmuş olur.
foreign ve primary ile tablolar birbirine bağlamadan da,
id leri ayni olan satirlarda işlem yap diyebiliriz,
böylelikle ayni field verilebilir, parent child ilişkisi olmamiş olur
*/

USE fsae03;

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY,
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);

drop table calisanlar;

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz', 12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10020', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
-- cem eklenmez maas integer olmalı
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
-- İKİNCİ KEZ BOŞ KARAKTER GİRİLEMEZ
INSERT INTO calisanlar VALUES('', 'veli can', 6000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');
-- eklenmez id null olamaz (primary key)

select * from calisanlar;

CREATE TABLE adresler
(
calisanlar_id CHAR(5),
adres_id CHAR(5),    
sokak VARCHAR(50),
cadde VARCHAR(30),
sehir VARCHAR(15),
CONSTRAINT calisanlar_id_fk FOREIGN KEY(calisanlar_id) REFERENCES calisanlar(id)
);

SELECT * 
FROM adresler;

INSERT INTO adresler (calisanlar_id, adres_id, sokak, cadde, sehir)
VALUES('10030','00001','Mutlu Sok', '40.Cad.','İSTANBUL');
-- bu adresi eklemez cunku 10030 keyi references calısanlar(id) kısmında yok







