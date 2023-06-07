-- Primary Key--
/*---------------------------------------------------------------------
"sehirler" isimli bir Table olusturun. 
Tabloda "alan_kodu", "isim", "nufus" field'lari olsun. 
Isim field'i bos birakilamasin. 
1.Yontemi kullanarak "alan_kodu" field'ini "Primary Key" yapin
-----------------------------------------------------------------------*/

CREATE TABLE sehirler2
(
alan_kodu INT PRIMARY KEY,
isim VARCHAR(20) NOT NULL,
nufus INT
);

/*------------------------------------------------------------------------------
"ogretmenler" isimli bir Table olusturun. 
Tabloda "id", "isim", "brans", "cinsiyet" field'lari olsun. 
Id field'i tekrarli deger kabul etmesin. 
2.Yontemi kullanarak "id ve isim" field'lerinin birlesimini "primary key" yapin 
-------------------------------------------------------------------------------*/

CREATE TABLE ogretmenler3
(
id INT UNIQUE,
isim VARCHAR(20),
brans VARCHAR(20),
cinsiyet CHAR(5),
CONSTRAINT id_isim_pk PRIMARY KEY(id,isim)
);

/*------------------------------------------------------------------------------
"universite_ogrenci_bilgi_sistemi" isimli bir Table olusturun. 
Tabloda "giris yili", "giris siralamasi", "isim", "bolum" field'lari olsun. 
isim field'i null deger kabul etmesin. 
2.Yontemi kullanarak "giris yili ve giris siralamasi" field'lerinin birlesimini
 "primary key" yapin 
-------------------------------------------------------------------------------*/

CREATE TABLE universite_ogrenci_bilgi_sistemi2
(
giris_yili INT,
giris_siralamasi INT,
isim VARCHAR(20) NOT NULL,
bolum VARCHAR(20),
CONSTRAINT gy_gs_PK PRIMARY KEY(giris_siralamasi,giris_yili)
);

-- FOREIGN KEY--
/*------------------------------------------------------------------------
"tedarikci" isimli bir tablo olusturun. 
Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" field'lari olsun 
ve "tedarikci_id" yi Primary Key yapin.
 "urunler" isminde baska bir tablo olusturun "tedarikci_id" ve "urun_id"
 field'lari olsun ve "tedarikci_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/

CREATE TABLE tedarikci2
(
tedarikci_id INT PRIMARY KEY,
tedarikci_ismi VARCHAR(20),
iletisim_isim VARCHAR(20)
);

CREATE TABLE urunler3
(
tedarikci_id INT,
urun_id INT,
CONSTRAINT urunler_fk2 FOREIGN KEY(tedarikci_id)
REFERENCES tedarikci2(tedarikci_id)
);



/*------------------------------------------------------------------------
"bebeler" isimli bir tablo olusturun. 
Tabloda "id", "isim", "iletisim" field'lari olsun 
ve "id" yi Primary Key yapin.
 "notlar" isminde baska bir tablo olusturun "bebe_id" ve "puan"
 field'lari olsun ve "bebe_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/

CREATE TABLE bebeler2
(
id INT PRIMARY KEY,
isim VARCHAR(20),
iletisim VARCHAR(20)
);

CREATE TABLE notlar2
(
bebe_id INT,
puan INT,
CONSTRAINT id_fk FOREIGN KEY(bebe_id)
REFERENCES bebeler2(id)
);


-- SELECT-REGEXP_LIKE--
-- 'c' => case-sensitive demektir
-- 'i' => case-insensitive demektir ve default case-insensitive aktiftir.


create table kelimeler3
(
id int unique,
kelime varchar(50) not null,
harf_sayisi int
);

 INSERT INTO kelimeler3 VALUES 
    (1001, 'hot', 3),
    (1002, 'hat', 3),
    (1003, 'hit', 3),
    (1004, 'hbt', 3),
    (1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
    (1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);
    
    select * from kelimeler3;
    
-- Q1 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e dikkat ederek listele
-- NOT: VEYA islemi icin | karakteri kullanilir.

SELECT kelime
FROM kelimeler3
WHERE REGEXP_LIKE (kelime,'ot|at','c');



    


-- Q2 : Icerisinde 'ot' veya 'at' bulunan kelimeleri 
-- case-sensitive'e dikkat etmeksizin listele

SELECT kelime
FROM kelimeler3
WHERE REGEXP_LIKE (kelime,'ot|at','i');


-- 'i' yazmasak da olur

-- Q3 : 'ho' veya 'hi' ile baslayan kelimeleri 
-- case-sensitive'e dikkat etmeksizin listele
-- NOT: Baslangici gostermek icin ^ karakteri kullanilir.
    
SELECT kelime
FROM kelimeler3
WHERE REGEXP_LIKE (kelime,'^ho|^hi','i');


-- Q4 : Sonu 't' veya 'm' ile bitenleri 
-- case-sensitive'e dikkat etmeksizin listele
-- NOT: Bitisi gostermek icin $ karakteri kullanilir.

SELECT kelime
FROM kelimeler3
WHERE REGEXP_LIKE (kelime,'t$|m$','i');
    


-- Q5 : h ile baslayip t ile biten 3 harfli kelimeleri 
-- (h ile t kucuk harfli olanlari) listeleyiniz
-- NOT : [!-~] = Butun karakterleri ifade eder.
--       [a-zA-Z0-9] = Harf ve rakamlari temsil eder.

SELECT kelime
FROM kelimeler3
WHERE REGEXP_LIKE (kelime,'^h[!-~]t$','c');

	


-- Q6 : h ile baslayip t ile biten, 2. karakteri sayi olan
-- 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz

SELECT kelime
FROM kelimeler3
WHERE REGEXP_LIKE (kelime, '^h[0-9]t$','c');



-- Q7 : h ile baslayip t ile biten, 2. karakteri buyuk harf olan
-- 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz

SELECT kelime
FROM kelimeler3
WHERE REGEXP_LIKE (kelime, '^h[A-Z]t$','c');


-- Q8 : 2. harfi O olan 3 harfli kelimeleri (o harfi buyuk olanlari)
-- ve id'lerini listeleyiniz

SELECT kelime,id
FROM kelimeler3
WHERE REGEXP_LIKE (kelime, '^[!-~][O][!-~]$','c');

	


-- Q9 : 2. ve 3. harfi o olan tum kelimeleri 
-- (case sensitive olmaksizin) listeleyiniz 

SELECT kelime
FROM kelimeler3
WHERE REGEXP_LIKE (kelime, '^[!-~][o][o]');
	

--- UPDATE---
/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
Id ve isim'i beraber Primary Key yapin.
---------------------------------------------------------------------------------------*/
CREATE TABLE firmalar3
(
id INT,
isim VARCHAR(20),
iletisim_isim VARCHAR(20),
CONSTRAINT firmalar1_pk PRIMARY KEY (id, isim)
);

/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/
INSERT INTO firmalar3 VALUES 
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez'),
(4, 'ABN', 'Ihsan Yilmaz');

SELECT * FROM firmalar3;

-- Id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz.

UPDATE firmalar3
SET isim = 'KRM'
WHERE id=3;



-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.

UPDATE firmalar3
SET id=4, isim='FDS'
WHERE iletisim_isim ='Veli Gul';



-- Ismi ACB olan firmanin iletisim ismini 'Osman Can' olarak guncelleyiniz.

UPDATE firmalar3
SET iletisim_isim = 'Osman Cans'
WHERE isim='ACB';



-- Iletisim ismi 'Osman Can' olan firmanin iletisim ismini 'Ayse Can' olarak guncelleyiniz.

UPDATE firmalar3
SET iletisim_isim = 'Ayse Can'
WHERE iletisim_isim = 'Osman Cans';





