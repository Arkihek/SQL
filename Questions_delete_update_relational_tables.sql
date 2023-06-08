/*================================== DELETE ============================================
DELETE FROM table_name komutu tablodaki tum recordlari siler.
Eger tum kayitlar silindikten sonra tabloyu gormek isterseniz size sadece bos bir tablo
gosterir. 
DELETE komutu sadece datalari siler, tabloyu silmez.
=======================================================================================*/

/*===============================================================================================
-- DELETE FROM tablo_adi;  Tablonun tum icerigini siler.
-- Bu komut bir DML komutudur. Dolayisiyla devaminda WHERE gibi cumlecikler
-- kullanilabilir.
    
    -- DELETE FROM tablo_adi
    -- WHERE field = veri;
    
--    DELETE FROM ogrenciler;     -- Tum verileri sil.
--    SAVEPOINT ABC;     -- Verilen konuma verileri kaydeder.
--    ROLLBACK TO  ABC;  -- Silinen Verileri geri getir.
-- Bilgileri geri getirirken sikinti yasamamak icin ayarlar sql execution auto commit tiki kaldir
==================================================================================================*/ 



-- WHERE deyimi olmadan delete komutunu kullanırsak, tüm satırlar tablodan silinir.--


use sys;
CREATE TABLE cucuklar06
(
id char(3),
isim varchar(50),
veli_isim varchar(50),
yazili_notu int,
CONSTRAINT cucuklar06_pk
PRIMARY KEY (id)
);

INSERT INTO cucuklar06 VALUES(123, 'Ali Can', 'Hasan',75); 
INSERT INTO cucuklar06 VALUES(124, 'Merve Gul', 'Ayse',85); 
INSERT INTO cucuklar06 VALUES(125, 'Kemal Yasa', 'Ali',85);

SELECT * FROM cucuklar06;

-- Veli Ismi Ali ya da Ayse olan kaydi siliniz

DELETE FROM cucuklar06
WHERE veli_isim='Ali' OR veli_isim='Ayse';



-- Yazili notu 84'ten buyuk olan cucuklari silin 

DELETE FROM cucuklar06
WHERE yazili_notu>84;


-- Yazili notu 85'ten farkli olan cucuklari silin 

DELETE FROM cucuklar06
WHERE yazili_notu!=85;




-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


CREATE TABLE cocuk06
    (
        id CHAR(3),
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int       
    );
  
    INSERT INTO cocuk06 VALUES(123, 'Melih Can', 'İsmail',75);
    INSERT INTO cocuk06 VALUES(124, 'Merve Gul', 'Ayse',85);
    INSERT INTO cocuk06 VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO cocuk06 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
    INSERT INTO cocuk06 VALUES(127, 'Mustafa Bak', 'Can',99);
    
    SELECT * FROM cocuk06;
    
-- Id'si 124'ten buyuk olan kayitlari silin : 

DELETE FROM cocuk06
WHERE id >124;
    
SAVEPOINT elma; -- Olusturdugumuz yeni bir alana database'imizin bir kopyasini koyduk
SAVEPOINT kiraz;
ROLLBACK TO elma; -- Bu satirda ise yaptigimiz degisiklikleri savepoint cilek durumundaki haline geri dondurduk
ROLLBACK TO kiraz;
/* ============================= DELETE - TRUNCATE - DROP ================================   
  
  => TRUNCATE TABLE komutu tablodaki tum datalari kalici olarak siler
  => Truncate ve Delete komutlarinin ikisi de bir tabloda bulunan recordlari silmek icin kullanilir.
  => Iki komut da sadece belirtilen tablodaki kayitlari siler.
  => En belirgin farki ise Delete komutu ile belirli bir araligi silebilirken,
  => Truncate komutu tablodaki tum verileri siler.
  
  1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamini siler.
    Ancak, secmeli silme yapamaz. Cunku Truncate komutu DML degil DDL komutudur.*/ 
   
       TRUNCATE TABLE cocuk06; -- dogru yazim
       DROP TABLE puanlar;
       DELETE FROM cocuklar
       WHERE id>125;
  
       SELECT * FROM cocuklar;
       
       
   /* 2-) DELETE komutu beraberinde WHERE cumlecigi kullanilabilir. TRUNCATE ile 
    kullanilmaz.
    
        TRUNCATE TABLE ogrenciler
        WHERE veli_isim='Hasan';  .....yanlis yazim
        
-- TRUNCATE komutu tablo yapisini degistirmeden, 
-- tablo icinde yer alan tum verileri tek komutla silmenizi saglar.
        
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylikla geri 
    alinabilir.
    
    4-) Truncate ile silinen veriler geri alinmasi daha zordur. Ancak
    Transaction yontemi ile geri alinmasi mumkun olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile birlikte tabloyu da 
    siler. 
    
    -- Tablodaki kayitlari silmek ile tabloyu silmek farkli islemlerdir.
    -- Silme komutlari da iki basamaklidir, biz genelde geri getirilebilecek sekilde sileriz. 
    -- Ancak bazen guvenlik gibi sebeplerle geri getirilmeyecek sekilde silinmesi istenebilir.
==============================================================================*/

/* DELETE:

Tablodaki satırları kaldırır. Satırları birer birer silin ve silinen her satır için işlem günlüğüne bir girdi kaydeder.
Silinen veriler geri alınabilir.
DML komutudur.
DELETE deyimi bir satır kilidi kullanılarak yürütüldüğünde, tablodaki her satır silinmek üzere kilitlenir.
TRUNCATE:

Tablodaki satırları kaldırır. Satırları birer birer silin ve silinen her satır için işlem günlüğüne bir girdi kaydeder.
Silinen veriler geri alınabilir.

DELETE deyimi bir satır kilidi kullanılarak yürütüldüğünde, tablodaki her satır silinmek üzere kilitlenir….
DROP:

SQL’de DROP komutu veritabanından bir tabloyu kaldırır.
DDL komutudur. */


/*SQL DROP TABLE deyimi tüm tablo tanımını kaldıracak ya da tablo yapısını veritabanından ve dolayısıyla kaydı kaldıracaktır.
 Şimdi veritabanında KURS adlı bir tablo yok. İstersek, yeni tabloyu tekrar oluşturmamız gerekir. */

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*============================== ON DELETE CASCADE ================================
  Her defasinda once child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme ozelligini aktif hale getirebiliriz.
  
  Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
===================================================================================*/
    CREATE TABLE talebeler06
    (
        id CHAR(3) primary key,  
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int
    );
    
    INSERT INTO talebeler06 VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler06 VALUES(124, 'Merve Gul', 'Ayse',85);
    INSERT INTO talebeler06 VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler06 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
    INSERT INTO talebeler06 VALUES(127, 'Mustafa Bak', 'Can',99);
    
    
    CREATE TABLE dereceler07
    (  
    talebe_id char(3), 
    ders_adi varchar(30), 
    yazili_notu int, 
    CONSTRAINT dereceler06_fk FOREIGN KEY (talebe_id) 
    REFERENCES talebeler06(id)    
	ON DELETE CASCADE
    ); 
    
    INSERT INTO dereceler06 VALUES ('123','Kimya',75);
    INSERT INTO dereceler06 VALUES ('124', 'Fizik',65);
    INSERT INTO dereceler06 VALUES ('125', 'Tarih',90);
    INSERT INTO dereceler06 VALUES ('126', 'Matematik',90); 
    INSERT INTO dereceler06 VALUES ('127', 'Matematik',23); 
    SELECT * FROM talebeler06;
    SELECT * FROM dereceler06;
    
    DELETE FROM talebeler06
    WHERE id>125;
    
    DELETE FROM dereceler06
    WHERE talebe_id>125;
    
    DROP TABLE dereceler06;
    
    DROP TABLE talebeler06;
    
    DELETE FROM talebeler06
    
    WHERE id>124;
    
    -- id, isim ve irtibat fieldlarinin oldugu bir tedarik tablosu olusturun.
-- id field'ini Primary Key yapin.

create table tedarik06
(
id int Primary Key,
isim varchar(10),
irtibat varchar(20)

);

-- tedarikci_id , urun_id , urun_isim , musteri_isim  fieldlari olan urun 
-- tablosu olusturun. Bu tablodaki tedarikci_id fieldini tedarik tablosunun
-- PK 'si ile Foreign Key yapin.

CREATE TABLE urun06
(
tedarikci_id int,
urun_id int,
urun_isim varchar(20),
musteri_isim varchar(20),
constraint urun06_fk Foreign key (tedarikci_id)
references tedarik06 (id)
);

INSERT INTO tedarik06 VALUES(100, 'IBM', 'Ali Can'); 
INSERT INTO tedarik06 VALUES(101, 'APPLE', 'Merve Temiz'); 
INSERT INTO tedarik06 VALUES(102, 'SAMSUNG', 'Kemal Can'); 
INSERT INTO tedarik06 VALUES(103, 'LG', 'Ali Can');
INSERT INTO urun06 VALUES(100, 1001,'Laptop', 'Suleyman'); 
INSERT INTO urun06 VALUES(101, 1002,'iPad', 'Fatma'); 
INSERT INTO urun06 VALUES(102, 1003,'TV', 'Ramazan'); 
INSERT INTO urun06 VALUES(103, 1004,'Phone', 'Ali Can');
SELECT * FROM tedarik06;
SELECT * FROM urun06;

-- 'LG' firmasinda calisan 'Ali Can'in ismini 'Veli Can' olarak degistiriniz.

UPDATE tedarik06
SET irtibat = 'Veli Can'
WHERE isim = 'LG';

/*
a) Urun tablosundan Ali Can'in aldigi urunun ismini, 
tedarik tablosunda irtibat Merve Temiz olan 
sirketin ismi ile degistirin. */

-- 1. Adim : Ali Can'in aldigi urunun ismini Apple olarak degistirin

UPDATE tedarik06
SET isim = 'Apple'
WHERE irtibat = 'Ali Can';

-- 2. Adim : Irtibat'i Merve Temiz olan kaydin sirket ismini getirin

SELECT isim
FROM tedarik06
WHERE irtibat = 'Merve Temiz';


-- 3. Adim : iki sorguyu birlestiriyoruz

UPDATE urun06
SET urun_isim = (SELECT isim
			FROM tedarik06
			WHERE irtibat = 'Merve Temiz')
WHERE musteri_isim = 'Ali Can';  
  
/*-------------------------------------------------------------------------
b) TV satin alan musterinin ismini, 
IBM'in irtibat'i ile degistirin.
-------------------------------------------------------------------------*/

UPDATE urun06
SET musteri_isim = (SELECT irtibat
					FROM tedarik06
                    WHERE isim = 'IBM')
WHERE urun_isim='TV';

-- ************************************************************************
/*-------------------------------------------------------------------------
1) Lise tablosu olusturun.
 Icinde id,isim,veli_isim ve grade field'lari olsun. 
 Id field'i Primary Key olsun.
 --------------------------------------------------------------------------*/
 
 CREATE TABLE lise06
 (
 id INT PRIMARY KEY,
 isim VARCHAR(20),
 veli_isim VARCHAR(20),
 grade INT
 );
 
 INSERT INTO lise06 VALUES
    (123, 'Ali Can', 'Hasan',75), 
    (124, 'Merve Gul', 'Ayse',85), 
    (125, 'Kemal Yasa', 'Hasan',85),
    (126, 'Rumeysa Aydin', 'Zeynep',85),
    (127, 'Oguz Karaca', 'Tuncay',85),
    (128, 'Resul Can', 'Tugay',85),
    (129, 'Tugay Kala', 'Osman',45);
 
 /*-------------------------------------------------------------------------
3)deneme_puani tablosu olusturun. 
ogrenci_id, ders_adi, yazili_notu field'lari olsun, 
ogrenci_id field'i Foreign Key olsun 
--------------------------------------------------------------------------*/
CREATE TABLE deneme_puani06
(
ogrenci_id INT,
ders_adi VARCHAR(10),
yazili_notu INT,
CONSTRAINT deneme_puani06_fk FOREIGN KEY(ogrenci_id)
REFERENCES lise06(id)
);

 INSERT INTO deneme_puani06 VALUES
    ('123','kimya',75), 
    ('124','fizik',65),
    ('125','tarih',90),
    ('126','kimya',87),
    ('127','tarih',69),
    ('128','kimya',93),
    ('129','fizik',25);
    
SELECT * FROM lise06;
SELECT * FROM deneme_puani06;
/*-------------------------------------------------------------------------
5) Ismi Resul Can olan ogrencinin grade'ini deneme_puani tablosundaki 
ogrenci id'si 129 olan yazili notu ile update edin. 
--------------------------------------------------------------------------*/

UPDATE lise06
SET grade = (SELECT yazili_notu
			FROM deneme_puani06
            WHERE ogrenci_id = 129)
WHERE isim = 'Resul Can';

/*-------------------------------------------------------------------------
6) Ders adi fizik olan kayitlarin yazili notunu Oguz Karaca'nin grade'i
ile update edin. 
--------------------------------------------------------------------------*/

UPDATE deneme_puani06
SET yazili_notu = (SELECT grade
					FROM lise06
                    WHERE isim = 'Oguz Karaca')
WHERE ders_adi = 'fizik';

/*-------------------------------------------------------------------------
7) Ali Can'in grade'ini, 124 ogrenci_id'li yazili_notu ile guncelleyin.
--------------------------------------------------------------------------*/

UPDATE lise06
SET grade = (select yazili_notu
			FROM deneme_puani06
            WHERE ogrenci_id = 124)
WHERE isim = 'Ali Can';

/*-------------------------------------------------------------------------
8) Ders adi Kimya olan yazili notlarini Rumeysa Aydin'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/

UPDATE deneme_puani06
SET yazili_notu = (SELECT grade
					FROM lise06
                    WHERE isim = 'Rumeysa Aydin')
WHERE ders_adi = 'kimya';

/*-------------------------------------------------------------------------
9) Ders adi tarih olan yazili notlarini Resul Can'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/

UPDATE deneme_puani06
SET yazili_notu = (SELECT grade
					FROM lise06
                    WHERE isim = 'Resul Can')
WHERE ders_adi = 'tarih';

/*-------------------------------------------------------------------------
10) Ders adi fizik olan yazili notlarini veli adi Tuncay olan 
grade ile guncelleyin.
--------------------------------------------------------------------------*/

UPDATE deneme_puani06
SET yazili_notu = (SELECT grade
					FROM lise06
                    WHERE veli_isim = 'Tuncay')
WHERE ders_adi = 'fizik';

/*-------------------------------------------------------------------------
11) Tum ogrencilerin gradelerini deneme_puani tablosundaki yazili_notu ile update edin. 
--------------------------------------------------------------------------*/

UPDATE lise06
SET grade = (SELECT yazili_notu
			FROM deneme_puani06
            WHERE deneme_puani06.ogrenci_id=lise06.id);
            
select * from lise06;
select * from deneme_puani06;

-- ************************************************************************
/*------------------------------------------------------------------------
Mart_satislar isimli bir tablo olusturun, 
icinde urun_id, musteri_isim, urun_isim ve urun_fiyat field'lari olsun
1) Ismi hatice olan musterinin urun_id'sini 30,urun_isim'ini Ford yapin 
2) Toyota marka araclara %10 indirim yapin 
3) Ismi Ali olanlarin urun_fiyatlarini %15 artirin 
4) Honda araclarin urun id'sini 50 yapin.
--------------------------------------------------------------------------*/
CREATE TABLE mart_satislar06
(
 urun_id int,
 musteri_isim varchar(20),
 urun_isim varchar(10),
 urun_fiyat int 
);

INSERT INTO mart_satislar06 VALUES (10, 'Ali', 'Honda',75000); 
INSERT INTO mart_satislar06 VALUES (10, 'Ayse', 'Honda',95200); 
INSERT INTO mart_satislar06 VALUES (20, 'Hasan', 'Toyota',107500); 
INSERT INTO mart_satislar06 VALUES (30, 'Mehmet', 'Ford', 112500); 
INSERT INTO mart_satislar06 VALUES (20, 'Ali', 'Toyota',88000); 
INSERT INTO mart_satislar06 VALUES (10, 'Hasan', 'Honda',150000); 
INSERT INTO mart_satislar06 VALUES (40, 'Ayse', 'Hyundai',140000); 
INSERT INTO mart_satislar06 VALUES (20, 'Hatice', 'Toyota',60000);
SELECT * FROM mart_satislar06;
-- 1) Ismi hatice olan musterinin urun_id'sini 30,urun_isim'ini Ford yapin 

UPDATE mart_satislar06
SET urun_id=30, urun_isim='Ford'
WHERE musteri_isim = 'hatice';

-- 2) Toyota marka araclara %10 indirim yapin 

UPDATE mart_satislar06
SET urun_fiyat = urun_fiyat*0.9
WHERE urun_isim = 'Toyota';

-- 3) Ismi A ile baslayan butun musterilerin urun_fiyatlarini %15 artirin 

UPDATE mart_satislar06
SET urun_fiyat = urun_fiyat*1.15
WHERE musteri_isim LIKE 'A%';

-- 4) Honda araclarin urun id'sini 50 yapin.

UPDATE mart_satislar06
SET urun_id = 50
WHERE urun_isim = 'Honda';
