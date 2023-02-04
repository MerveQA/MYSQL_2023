CREATE DATABASE merve;
USE merve;
CREATE TABLE personel
(
id int,
isim varchar(50),
adres text,
sinav_notu int
);
drop table ogrenciler;


select * from ogrenciler;

insert into ogrenciler (id,isim,adres,sinav_notu)
values (120,'Ali Can','Ankara',75);
insert into ogrenciler (id,isim,adres,sinav_notu)
values (121,'Veli Mert','Trabzon',85);
insert into ogrenciler (id,isim,adres,sinav_notu)
values (122,'Ayse Tan','Bursa',65);
insert into ogrenciler (id,isim,adres,sinav_notu)
values (123,'Derya Soylu','Istanbul',95);
insert into ogrenciler (id,isim,adres,sinav_notu)
values (124,'Yavuz Bal','Ankara',80);


-- where --> select * fram table adı where koşul

-- SORU1) sinav_notu 80 den yuksek olan ögrencileri listele
select * from ogrenciler where sinav_notu>80;

-- SORU1) sinav_notu 80 den yuksek olan ögrencilerin ismini listele
select isim from ogrenciler where sinav_notu>80;

-- SORU2) Adresi Ankara olan öğrencilerin isim ve adresini listele
select isim,adres 
from ogrenciler 
where adres='Ankara';

-- SORU3) id si 124 olan öğrencinin tum bilgilerini listele
select * 
from ogrenciler
where id =124; 

-- SORU 4) id si 121 olan ogrencinin adres ve sınav notu

select adres,sinav_notu
from ogrenciler
where id=121;

CREATE TABLE personel
(
id char(4),
isim varchar(40),
maas int
);
drop table ogrenciler; 
select * from personel;

insert into personel values('1001', 'Ali Can', '70000');
insert into personel values('1002', 'Veli Mert','85000');
insert into personel values('1003', 'Ayşe Tan', '65000');
insert into personel values('1004', 'Derya Soylu', '95000');
insert into personel values('1005', 'Yavuz Bal', '80000');
insert into personel values('1006', 'Sena Beyaz', '100000');

drop table personel;personel

-- AND 
-- Belirtilen sartların her ikisi de gercekleşiyırsa o kayıt listelenir
-- bir tanesi gercekleşmez ise o liste lşstelenmez

-- SORU1) Maası 65000 ile 90000 arasında olan personellerin listesi
SELECT * 
FROM personel
where maas > 65000 AND maas < 90000;

-- SORU 2) Ali can ın bilgisi ve maası 80000 den cok olanların maaşını listeleyin 
SELECT * 
FROM personel
where isim ='Ali Can' OR maas > 80000;

-- SORU 3) İd si 102 ile 105 arasında olan personel bilgilerini listele
SELECT * 
FROM personel
where id>=1002 AND id<=1005;

/*
BETWEEN: Belirttiginiz 2 veri arasindaki bilgileri listeler
         Between de belirttigimiz degerlerde listelemeye dahildir.
         Once kucuk olan deger yazilir AND`den sonra buyuk olan deger yazilir yoksa calismaz
*/


SELECT * 
FROM personel
where id BETWEEN 1002 AND 1005;

-- SORU 5) Derya soylu ile yavuz bal arasındaki kişileri listele
SELECT * 
FROM personel
where isim BETWEEN 'Derya Soylu' AND 'Yavuz Bal';

-- SORU 8) Maası sadece 70000 ve 10000 olanları listele
SELECT * 
FROM personel
where maas=70000 OR maas=100000;

-- IN 
SELECT * 
FROM personel
where maas IN ( 70000 , 100000 );


-- SORU 9) id si 1001 , 1002 , 1004 olanları listele
select * 
from personel 
where id = 1001 or id =1002 or id =1004;

SELECT * 
FROM personel 
where id in (1001,1002,1004);

SELECT * 
FROM personel
where isim BETWEEN 'Yavuz Bal' AND 'Derya Soylu';




-- 1 ŞUBAT ÇARŞAMBA
-- SELECT sutun1 , sutun2 , ...
-- FROM tablo_adı
-- WHERE sutun LIKE patern

-- patern işaretleri
-- %  --> 0 veya daha fazlakarakteri belirtir
-- _ --> tek bir karakter

-- SORULAR
-- SORU 1) İsmi A harfi ile baslayan personeller
SELECT *
FROM personel
WHERE isim LIKE 'A%' ;

-- SORU 2) İsminin ikinci harfi E olup diğer harflerinde Y olAN
SELECT *
FROM personel
WHERE isim LIKE '_E%Y%' ;

-- SORU 3) İsminde A harfi olmayan personeli listeleyin
SELECT *
FROM personel
WHERE isim NOT LIKE '%A%' ;

-- SORU 4) İsminde 1. harfi ve 7. harfi A olan personel listeleyin
SELECT *
FROM personel
WHERE isim LIKE 'A_____A%' ;

-- NOT BETWEEN
-- NOT LIKE
-- NOT  (...AND...)
-- NOT  (...OR...)

SELECT * 
FROM personel
WHERE NOT  (maas = 70000 OR maas = 100000 );







