-- CREATE

-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.

CREATE TABLE student 
(
id CHAR(3), --
isim VARCHAR(25),
not_ortalamasi DOUBLE,
adres VARCHAR(25),
son_degistirme_tarihi DATE 
);
-- YYYY,AA,GG

SELECT * FROM student;

-- student tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.

CREATE TABLE ogrenci_dereceleri
AS
SELECT isim,not_ortalamasi
FROM student;

SELECT * FROM ogrenci_dereceleri;


/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/

CREATE TABLE tedarikciler1 
(
tedarikci_id CHAR(4),
tedarikci_ismi VARCHAR(25),
tedarikci_adres VARCHAR(30),
ulasim_tarihi DATE
);

SELECT * FROM tedarikciler1;



/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/

CREATE TABLE tedarikciler_son2
AS
SELECT tedarikci_ismi,ulasim_tarihi
FROM tedarikciler1;

SELECT * FROM tedarikciler_son2;


-- INSERT

-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.

-- UNIQUE, NOT NULL

CREATE TABLE fen_lisesi1
(
okul_no CHAR(3) UNIQUE,
isim VARCHAR(25) NOT NULL,
derece DOUBLE,
adres VARCHAR(25),
son_degisiklik_tarihi DATE
);

-- INSERT INTO + tablo_adi + VALUES ();

INSERT INTO fen_lisesi1 VALUES ('101','ihsan Yilmaz',85,'SAMSUN','2023-06-06');
INSERT INTO fen_lisesi1 VALUES ('102','ihsan',80,'ORDU','2023-06-06');
INSERT INTO fen_lisesi1 VALUES ('103','',80,'ORDU','2023-06-06');
INSERT INTO fen_lisesi1 VALUES ('104','ihsan',80,NULL,'2023-06-06');
INSERT INTO fen_lisesi1 VALUES (106,'Kubra Filiz',3.8,'Ankara','2023-05-22');
INSERT INTO fen_lisesi1 VALUES (105,'Yasemin Tahtali',4.9,'Kutahya','2023-05-30');
INSERT INTO fen_lisesi1 VALUES (107,'Adem Tekin',4.3,null,'2023-05-11');
INSERT INTO fen_lisesi1 VALUES (108,'Akif Gurkan',null,'Bartin','2023-05-30');
INSERT INTO fen_lisesi1 VALUES (null,'Muhammet Ozyon',3.8,'Bartin','2023-05-30');


SELECT * FROM fen_lisesi1;

/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */

CREATE TABLE anadolu_lisesi1
(
okul_no CHAR(3) UNIQUE,
isim VARCHAR(25) NOT NULL,
derece DOUBLE,
adres VARCHAR(25)
);

INSERT INTO anadolu_lisesi1 VALUES ('101','ihsan Yilmaz',85,'SAMSUN'),
('102','ihsan Yilmaz',85,'SAMSUN'),
('103','ihsan Yilmaz',85,'SAMSUN');

SELECT * FROM anadolu_lisesi1;

-- SELECT

CREATE TABLE meslek_lisesi11 (
okul_no CHAR(4) UNIQUE,
isim VARCHAR(50) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE
);

INSERT INTO meslek_lisesi1 VALUES('1001','Fatih Oz', 89,'Ankara', '2022-11-23');      
INSERT INTO meslek_lisesi1 VALUES('1002','Fatih Yildiz', 94,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi1 VALUES('1003','Bora Sverige', 78,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi1 VALUES('1004','Nevzat Celik', 69,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi1 VALUES('1005','Gursel Unal', 90,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi1 VALUES('1006','Soner Karatasoglu ', 85,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi1 VALUES('1007','Talha Kurt', 75,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi1 VALUES('1008','Yakup Lejon', 79,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi1 VALUES('1009','Ilhan Gurbetci', 80,'Izmir', '2022-11-23');

SELECT * FROM meslek_lisesi1;


-- Q1 : Derecesi 90'dan yuksek olan ogrencilerin tum bilgilerini getirin.

SELECT *
FROM meslek_lisesi1
WHERE derece>90;


-- Q2 : Derecesi 80'den kucuk olan ogrencilerin isimlerini listeleyin.

SELECT isim
FROM meslek_lisesi1
WHERE derece<80;

-- Q3 : Adresi Ankara olan ogrencilerin isim ve derece bilgilerini listeleyin.

SELECT isim,derece
FROM meslek_lisesi1
WHERE adres='ankara';


-- Q4 : okul_no'su 1005 olan ogrencinin isim ve adres bilgisini listeleyin.

SELECT isim, adres
FROM meslek_lisesi1
WHERE okul_no='1005';

-- Q5 : Derecesi 70 ile 80 arasinda olan ogrencilerin okul_no ve adreslerini listeleyin.
-- 1. YONTEM
SELECT okul_no, adres
FROM meslek_lisesi1
WHERE 70<derece && derece<80;

-- 2. YONTEM
SELECT okul_no, adres
FROM meslek_lisesi1
WHERE 70<derece AND derece<80;

/*-------------------------------------------------------------------------
Q6: Derecesi 70'ten buyuk 80'den kucuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/

SELECT *
FROM meslek_lisesi1
WHERE 70<derece AND derece<80;


CREATE TABLE ogretmen_lisesi1(
id int,
isim VARCHAR(45),
adres VARCHAR(100),
sinav_notu DOUBLE
);

INSERT INTO ogretmen_lisesi1 VALUES (111, 'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi1 VALUES (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi1 VALUES (113, 'Ilhan Sahin', 'Ankara', 70);
INSERT INTO ogretmen_lisesi1 VALUES (114, 'Kadir Corumlu', 'Corum', 90);
INSERT INTO ogretmen_lisesi1 VALUES (115, 'Selman Kasabali', 'Ankara',70);
INSERT INTO ogretmen_lisesi1 VALUES (116, 'Murat Aycicek', 'Izmir', 85);
INSERT INTO ogretmen_lisesi1 VALUES (117, 'Tugba Ozsoy', 'Bolu', 85);

SELECT * FROM ogretmen_lisesi1;

/*-------------------------------------------------------------------------
Q7: Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim
FROM ogretmen_lisesi1
WHERE isim
BETWEEN 'Muhammet Talha' AND 'Murat';

/*-------------------------------------------------------------------------
Q8: Ankara ile Corum arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim
FROM ogretmen_lisesi1
WHERE adres
BETWEEN 'Ankara' AND 'Corum';

CREATE TABLE personel1(
id CHAR(5),
isim VARCHAR(50),
maas INT
);

INSERT INTO personel1 VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel1 VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel1 VALUES('10003','Meryem',7215);
INSERT INTO personel1 VALUES('10004','Veli Han',5000);
INSERT INTO personel1 VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel1 VALUES('10006','Ayse Can',5600);
INSERT INTO personel1 VALUES('10010','Ayse',4700);
INSERT INTO personel1 VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel1 VALUES('10008','Ayse Cano',4300);
INSERT INTO personel1 VALUES('10007','Can Ayse',7700);
INSERT INTO personel1 VALUES('10011','Yeliz Alina',12700);

SELECT * FROM personel1;

/*-------------------------------------------------------------------------
Q9: id'si 10005 ile 10009 arasinda olan personel1in bilgilerini listele
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE id
BETWEEN '10005' AND '10009';

/*-------------------------------------------------------------------------
Q10: Ismi Mehmet Yilmaz ile Veli arasinda olan personel1 bilgilerini listeleyin
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli'; 

/*-------------------------------------------------------------------------
Q11: Ismi Ismi Ahmet ile Ayse Cano arasinda olan personel1 bilgilerini listeleyin
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim
BETWEEN 'Ahmet' AND 'Ayse Cano'; 

/*-------------------------------------------------------------------------
Q12: Maasi 7000 ya da ismi Ayse olan personel1 id'lerini listeleyin
---------------------------------------------------------------------------*/

SELECT id
FROM personel1
WHERE maas=7000 OR isim='Ayse';

/*-------------------------------------------------------------------------
Q13: Id'si 10001, 10005 ya da 10008 olan personel1 isimlerini listeleyin
---------------------------------------------------------------------------*/
SELECT isim
FROM personel1
WHERE id='10001' OR id='10005' OR id='10008';

SELECT isim
FROM personel1
WHERE id='10001' || id='10005' || id='10008';

/*-------------------------------------------------------------------------
Q13: Id'si 10001, 10005 ya da 10008 olan personel1 isimlerini listeleyin / SELECT-IN ile cozun
---------------------------------------------------------------------------*/
SELECT isim
FROM personel1
WHERE id IN (10001,10005,10008);


/*-------------------------------------------------------------------------
Q15: Maasi sadece 7000 veya 12000 olan personel1in bilgilerini listele
---------------------------------------------------------------------------*/

SELECT *
FROM personel1
WHERE maas IN (7000,12000);

/*-------------------------------------------------------------------------
Q16: Ismi A ile baslayan personel1i listeleyiniz
---------------------------------------------------------------------------*/

-- '____'
-- 'a%'
-- '%a%'
-- '%a'
-- '_a%'
-- '_a_'
-- '^a|r$'

SELECT *
FROM personel1
WHERE isim LIKE 'a%';

/*-------------------------------------------------------------------------
Q17: Isminde Ayse iceren personel1in isimlerini listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim LIKE '%ayse%';


/*-------------------------------------------------------------------------
Q18: Ismi n harfi ile biten personel1i listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim LIKE '%n';


/*-------------------------------------------------------------------------
Q19: Isminin 2. harfi e olan personel1i listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel1
WHERE isim LIKE '_e%';


/*-------------------------------------------------------------------------
Q20: Isminin 2. harfi e olup diger harflerinde y olan personel1i listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel1
WHERE isim LIKE '_e%' AND isim LIKE '%y%';


/*-------------------------------------------------------------------------
Q21: Isminde a harfi olmayan personel1i listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel1
WHERE isim NOT LIKE '%a%';


/*-------------------------------------------------------------------------
Q22: Maasi 5 haneli olan personel1i listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel1
WHERE maas LIKE '_____';

/*-------------------------------------------------------------------------
Q23: 1. harfi a ve 7. harfi a olan personel1i listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel1
WHERE isim LIKE 'a_____a%';
