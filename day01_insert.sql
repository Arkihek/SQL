/*========================================
               VERI GIRISI
========================================*/

-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.

/*******************************************************

-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.

*********************************************************/

-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.

CREATE TABLE fen_lisesi
(
okul_no INT UNIQUE,
isim VARCHAR(25) NOT NULL,
derece DOUBLE,
adres VARCHAR(25),
son_degisiklik_tarihi DATE
);

SELECT * FROM fen_lisesi;

-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)

INSERT INTO fen_lisesi VALUES (101,'Mustafa Onkibar',4.3,'Rize','2023-05-23');
INSERT INTO fen_lisesi VALUES (102,'Esat Fatih',4.5,'Balikesir','2023-05-22');
INSERT INTO fen_lisesi VALUES (103,'Sevda Sari',4.1,'Erzurumr','2023-05-19');
INSERT INTO fen_lisesi VALUES (104,'Veysel Jonturk',4.7,'Mersin','2023-05-20');
INSERT INTO fen_lisesi VALUES (106,'Kubra Filiz',3.8,'Ankara','2023-05-22');
INSERT INTO fen_lisesi VALUES (105,'Yasemin Tahtali',4.9,'Kutahya','2023-05-30');
INSERT INTO fen_lisesi VALUES (107,'Adem Tekin',4.3,null,'2023-05-11');
INSERT INTO fen_lisesi VALUES (108,'Akif Gurkan',null,'Bartin','2023-05-30');
INSERT INTO fen_lisesi VALUES (null,'Muhammet Ozyon',3.8,'Bartin','2023-05-30');
INSERT INTO fen_lisesi VALUES (null,'Ihsan Yilmaz',5.0,'Ordu','1995-08-09');

-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder, 
-- diger kayitlarda duplicate hatasi verir.

/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */

CREATE TABLE anadolu_lisesi
(
okul_no CHAR(3) UNIQUE,
isim VARCHAR(20) NOT NULL,
adres VARCHAR(20),
derece DOUBLE
);

SELECT * FROM anadolu_lisesi;

INSERT INTO anadolu_lisesi VALUES ('101','Esat Fatih','Ankara',4.7);
INSERT INTO anadolu_lisesi VALUES ('102','Yusuf Rahman','Ankara',4.2);
INSERT INTO anadolu_lisesi VALUES ('103','Sevda Su','Samsun',4.3);
INSERT INTO anadolu_lisesi VALUES ('104','Muhammet Ozyon','Izmir',4.1);
INSERT INTO anadolu_lisesi VALUES ('105','Ihsan Yilmaz','Ordu',4.2);
INSERT INTO anadolu_lisesi VALUES ('106','Suleyman Soysuz','Istanbul',1.0);
INSERT INTO anadolu_lisesi VALUES ('','Ayse Yilmaz','Istanbul',1.5);
INSERT INTO anadolu_lisesi VALUES ('','Ali Yilmaz','Samsun',5.0); -- bunu kaydetmez duplicate hatasi aliriz
INSERT INTO anadolu_lisesi (okul_no,isim) VALUES ('107','Ayse Yilmaz');
INSERT INTO anadolu_lisesi (adres,isim) VALUES ('Samsun','Ali Yilmaz');
INSERT INTO anadolu_lisesi (adres,okul_no,derece) VALUES ('Agri','108',4.1); -- bunu kaydetmez isim not null olamaz




