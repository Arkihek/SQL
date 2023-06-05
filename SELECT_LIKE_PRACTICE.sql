-- ************************ Kelimeler Tablosundan *******************************
/*-------------------------------------------------------------------------
Q1: 3 harfli kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE kelime LIKE '___';

/*-------------------------------------------------------------------------
Q2: En az 3 harfli kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE kelime LIKE '___%';

/*-------------------------------------------------------------------------
Q3: H ile baslayip t ile biten kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE kelime LIKE 'H%t';

/*-------------------------------------------------------------------------
Q4: H ile baslayip t ile biten kelimeleri case sensitive listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime,'^H.*t$','c');

/*-------------------------------------------------------------------------
Q5: H ile baslayip T ile biten 3 harfli kelimeleri case sensitive listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime,'H[!-~]T','c');

/*-------------------------------------------------------------------------
Q6: 3 ya da daha az karakterli kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE kelime NOT LIKE '____%';

/*-------------------------------------------------------------------------
Q7: id'si 8 rakamini iceren kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT id,kelime
FROM kelimeler
WHERE id LIKE '%8%';

SELECT * FROM kelimeler;