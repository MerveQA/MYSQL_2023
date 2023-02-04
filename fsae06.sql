-- 4 ŞUBAT CUMARTESİ 2023

use fsae04;

-- SET SQL_SAFE_UPDATES = 0
-- 0 oldugunda safe modu kapatır
-- 1 oldugunda safe modu acar 

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO personel VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO personel VALUES(456789012, 'Ayse Gul', 'Ankara, 1500, ‘Ford');
INSERT INTO personel VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');


CREATE TABLE sirketler
(
sirket_id int,
sirket varchar(20),
personel_sayisi int
);

INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);

SELECT * FROM personel;
-- DROP TABLE personel;
SELECT * FROM sirketler;
-- DROP TABLE sirketler;

-- SORU 1) Personel sayısı 15.000’den çok olan şirketlerin isimlerini ve bu şirkette çalışan 
-- personelin isimlerini listeleyin

SELECT isim, sirket
FROM personel
WHERE sirket IN (SELECT sirket
FROM sirketler
WHERE personel_sayisi > 15000);

-- SORU 2) sirket_id’si 101’den büyük olan şirketlerin maaşlarını ve şehirlerini listeleyiniz
SELECT maas, sehir 
FROM personel
WHERE sirket IN (SELECT sirket 
FROM sirketler
WHERE sirket_id > 101 );

-- SORU 3) Ankara’daki şirketlerin sirket_id ve çalışan sayılarını listeleyiniz
select sirket_id, personel_sayisi from sirketler where sirket in
(SELECT sirket FROM personel WHERE sehir ='Ankara');

-- AGGREGATE FUNCTION
-- SUM : TOPLAM
-- COUNT : 
-- MIN :
-- MAX : 
-- AVG :

-- SORU 1) Her şirketin ismini, personel sayısını ve personelin 
-- ortalama maaşını listeleyen bir QUERY yazın
SELECT sirket, personel_sayisi,
(
SELECT AVG(maas)
FROM personel
WHERE sirketler.sirket=personel.sirket
)
FROM sirketler;

select sirket , personel_sayisi , 
((select sum(maas) from personel where personel.sirket = sirketler.sirket) / 
(select count(id) from personel where personel.sirket = sirketler.sirket)) as "ortalama maas"
from sirketler;

-- SORU 2) Her şirketin ismini ve personelin aldığı max. maaşı listeleyen bir QUERY yazın.
SELECT sirket,
(SELECT MAX(maas)
FROM personel
WHERE sirketler.sirket = personel.sirket
) 
AS sirketteki_Max_Maas
FROM sirketler;

-- SORU 3) Her şirketin id’sini, ismini ve toplam kaç şehirde bulunduğunu 
-- listeleyen bir QUERY yazınız.
SELECT sirket_id,sirket,(SELECT COUNT(sehir)
FROM personel
WHERE sirketler.sirket=personel.sirket)
bulundugu_sehir_sayisi
FROM sirketler;

-- SORU 4) Her şirketin ismini, personel sayısını ve personelin aldığı max. 
-- ve min. maaşı listeleyen bir QUERY yazın
SELECT sirket,personel_sayisi,(SELECT MAX(maas)
FROM personel
WHERE sirketler.sirket = personel.sirket
) max_maas,
(SELECT MIN(maas)
FROM personel
WHERE sirketler.sirket = personel.sirket
) min_maas
FROM sirketler;

-- SORU 5) Her şirketin ismini ve personel sayısını ve işçilere ödediği
-- toplam maaşı listeleyen bir QUERY yazın.
SELECT sirket,personel_sayisi,(SELECT SUM(maas)
FROM personel
WHERE sirketler.sirket=personel.sirket
) toplam_maas
FROM sirketler;





###### EXISTS Condition ######
/*
EXISTS Condition Subquery’ler ile kullanılır.
IN ifadesinin kullanımına benzer olarak,
EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar.
*/

CREATE TABLE mart_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE nisan_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

-- SORU 1) Her iki ayda da aynı id ile satılan ürünlerin urun_id’lerini
-- ve ürünleri Mart ayında alanların isimlerini getiren bir query yazınız.
SELECT musteri_isim
FROM mart_satislar
WHERE EXISTS (SELECT urun_id
FROM nisan_satislar
WHERE mart_satislar.urun_id = nisan_satislar.urun_id);

-- SORU 2) Her iki ayda da satılan urun_isimleri aynı
-- ürünlerin urun_isim’ini ve ürünleri Nisan ayında alanların
-- isimlerini getiren bir query yazınız
SELECT urun_isim, musteri_isim
FROM nisan_satislar
WHERE EXISTS (SELECT urun_isim
FROM mart_satislar
WHERE mart_satislar.urun_isim =
nisan_satislar.urun_isim);

SELECT musteri_isim
FROM nisan_satislar
WHERE NOT EXISTS (SELECT urun_isim
FROM mart_satislar
WHERE mart_satislar.urun_isim =
nisan_satislar.urun_isim);


-- IS NULL Condition --
-- Arama yapılan field’da NULL değeri almış kayıtları getirir.

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT *
FROM insanlar
WHERE isim IS NULL;

SELECT *
FROM insanlar
WHERE isim IS NOT NULL;

UPDATE insanlar
SET isim = 'Isim Girilmemis'
WHERE name IS NULL;





