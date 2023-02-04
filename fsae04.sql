-- 2 ŞUBAT PERŞEMBE 2023

CREATE DATABASE fsae04;

use fsae04;

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
-- MMAS NULL OLAMAZ
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
--
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
-- cem eklenmez maas integer olmalı
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'veli can', 6000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');
-- eklenmez id null olamaz (primary key)

select * from calisanlar;

CREATE TABLE adresler
(
calisanlar_id CHAR(5),   
sokak VARCHAR(50),
cadde VARCHAR(30),
sehir VARCHAR(15),
CONSTRAINT calisanlar_id_fk FOREIGN KEY(calisanlar_id) REFERENCES calisanlar(id)
);

SELECT * 
FROM adresler;

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

INSERT INTO adresler VALUES('10011','Ağa Sok', '30.Cad.','Antep');
--  Cannot add or update a child row: a foreign key constraint fails 
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
-- NULL oldugunda izin veryor

-- PRİMARY KEY ve FOREIGN KEY bağlantılı tablolarda 
-- master dan update etmek istediğimiz bir bilgi varsa once onun baglantılı oldugu child da degişiklik
-- yapmalıyım.

drop table adresler;

SELECT * 
FROM adresler;
select * from calisanlar;

DELETE FROM adresler;
--  You are using safe update mode and you tried to update a table without 
--  WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences
--  guvenli modda olunca silmeye izin vermedi

DELETE FROM calisanlar;
--  You are using safe update mode and you tried to update a table without 
--  WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences
--  guvenli modda olunca silmeye izin vermedi

DELETE FROM calisanlar where id=10002;
--  You are using safe update mode and you tried to update a table without 
--  WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences
--  guvenli modda olunca silmeye izin vermedi

-- ***** GUVENLİ MODDAN CIKIS YAPMA *****
-- edit / Preferences / sql editor / en alt kısımdaki click kalsın
-- SONRASINDA SİLME İŞLEMLERİMİZİ YAPABİLİYORUZ

-- GUVENLİ MODDAN CIKILDIKTAN SONRA 
DELETE FROM calisanlar;
-- Cannot delete or update a parent row: a foreign key constraint fails
-- Önce child silinmeli o yuzden silmedi

DELETE FROM adresler;
-- calıstı ve sildi 

CREATE TABLE mart_satislar (
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50),
urun_fiyat int
);

INSERT INTO mart_satislar VALUES (10, 'Ali', 'Honda',75000);
INSERT INTO mart_satislar VALUES (10, 'Ayse', 'Honda',95200);
INSERT INTO mart_satislar VALUES (20, 'Hasan', 'Toyota',107500);
INSERT INTO mart_satislar VALUES (30, 'Mehmet', 'Ford', 112500);
INSERT INTO mart_satislar VALUES (20, 'Ali', 'Toyota',88000);
INSERT INTO mart_satislar VALUES (10, 'Hasan', 'Honda',150000);
INSERT INTO mart_satislar VALUES (40, 'Ayse', 'Hyundai',140000);
INSERT INTO mart_satislar VALUES (20, 'Hatice', 'Toyota',60000);

SELECT * FROM mart_satislar;

-- ***** SORULAR *****
-- SORU 1) Hatice nin urun ıd sini 30 , urun ismini Ford yapalım

UPDATE mart_satislar
SET urun_id=30,
urun_isim='Ford'
Where musteri_isim='Hatice';

-- SORU 2) Toyoto marka araclara^%10 indirim yapın

UPDATE mart_satislar
SET urun_fiyat = urun_fiyat*0.9
where urun_isim = 'TOYOTA';

-- SORU 3) İsmi Ali olanların urun fiyatları %15 arttırın

UPDATE mart_satislar
SET urun_fiyat = urun_fiyat*1.15
where musteri_isim='Ali';

-- SORU 4) Honda marka aracların urunkodunu 50 yapın

UPDATE mart_satislar
SET urun_id = 50
where urun_ismi = 'Honda';

-- SET SQL_SAFE_UPDATES = 0

CREATE TABLE tedarikciler
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);


INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Ericson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

SELECT * 
FROM tedarikciler;


CREATE TABLE urunler
(
tedarikciler_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT urunler_fk FOREIGN KEY(tedarikciler_vergino) REFERENCES tedarikciler(vergi_no)
ON DELETE CASCADE
);


INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

SELECT * 
FROM urunler ;

-- SORU 5)  Vergi no su 102 olan urunun ismini vestel olarak degisştirin 

update tedarikciler 
set firma_ismi='Vestel' where vergi_no = 102;

-- SORU 6) Tedarikçiler firmasındaki tum isimleri Casper olarak guncelleyin

UPDATE tedarikciler
SET firma_ismi = 'Casper';

-- SORU 7) Vergi nosu101 olan tedarikçinin ismini Casper  ve irtibat ismini Ali Veli olarak guncelleyşn

UPDATE tedarikciler
SET firma_ismi = 'Casper', irtibat_ismi = 'Ali Veli'
WHERE tedarikciler_vergino = 101;

SELECT * FROM tedarikciler;

-- SORU 7) firma ismi casper olan tedarikçinin irtibat ismini Bill Gates olarak guncelleyın

UPDATE tedarikciler
SET irtibat_ismi = 'Bill Gates'
WHERE firma_ismi = 'Casper';

SELECT * FROM tedarikciler;

-- SORU 8) urunler tablosundaki urun ıd degeri 1004 den buyuk olanların urun ıd sini bir arttırın

UPDATE urunler
SET urun_id = urun_id + 1
WHERE urun_id > 1004 ;

SELECT * FROM urunler;

-- SORU 9) urunler tablosundaki urun id degerini tedarikciler vergi no sutunu ile toplayarak guncelleyin 

UPDATE urunler
SET urun_id = urun_id + tedarikciler_vergino;

SELECT * FROM urunler;

-- SORU 10) urunler tablosundan Ali Bak ın aldıgı urun ismini , tedarikci tablosunda irtibat ismi 
-- Adam Eve olan firmasının ımı ile degistirin.

UPDATE urunler
SET urun_isim = (SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi = 'Adam Eve' )
WHERE musteri_isim = 'Ali Bak';

SELECT * FROM urunler;

-- SORU 11) Laptop satın alan musterilerin ismini , firma ismi Apple nın irtibat_ismi ile degisştirin

UPDATE urunler
SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi = 'Apple')
WHERE urun_isim = 'Laptop';

SELECT * FROM urunler;

-------



