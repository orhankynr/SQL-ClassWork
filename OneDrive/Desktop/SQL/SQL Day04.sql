--------------DAY'4 NT-------------------
--23-ALIASES:Etiket/Rumu<:Tblo veya sütunlara geçici isimim verilebilir.
CREATE TABLE workers(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO workers VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO workers VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM workers;

SELECT calisan_id AS id FROM workers;
SELECT calisan_id  id FROM workers;

SELECT calisan_id ||' - ' || calisan_isim AS id_isim FROM workers;

SELECT * FROM workers AS calisanlar;--w


--24-SUBQUERY--NESTED QUERY



CREATE TABLE calisanlar3 (
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

SELECT * FROM markalar;
SELECT * FROM calisanlar3

SELECT * FROM calisanlar;
SELECT * FROM markalar;

--marka_id si 100 olan markada çalışanları listeleyiniz.
SELECT marka_isim FROM markalar WHERE marka_id=100;--vakko

SELECT * FROM calisanlar3 WHERE isyeri='Vakko';

--2. Yol
SELECT *
FROM calisanlar3
WHERE isyeri=(SELECT marka_isim
			 FROM markalar
			 WHERE marka_id-100)
			 
--INTERVIEW QUESTION:calisanlar3 tablosunda max maaşı alan çalışanın tüm fieldlarını listeleyiniz.

SELECT *
FROM calisanlar3
WHERE maas=(SELECT MAX(maas)FROM calisanlar3)

--Interview Question:calisanlar3 tablosunda ikinci en yüksek maaşı gösteriniz.ÖDEV

--calisanlar3 tablosunda max veya min maaşı alan çalışanların
-- tüm fieldlarını gösteriniz.

SELECT * 
FROM calisanlar3
WHERE maas=(select max(maas) from calisanlar3) or maas=(select min(maas) from calisanlar3)

-- Ankara'da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

SELECT marka_id, calisan_sayisi
FROM markalar
WHERE marka_isim IN ('Pierre Cardin','Vakko','Adidas')

--2.Yol
SELECT marka_id, calisan_sayisi
FROM markalar
WHERE marka_isim IN (SELECT isyeri FROM calisanlar3 WHERE sehir='Ankara')

--marka_id'si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

SELECT isim,maas,sehir
FROM calisanlar3
WHERE isyeri IN(SELECT marka_isim FROM markalar WHERE marka_id>101)

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve 
--bu markada calisanlarin isimlerini ve maaşlarini listeleyiniz.
SELECT isim,maas,isyeri
FROM calisanlar3 
WHERE isyeri IN(SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000)


--24-a-SUBQUERY: WHERE ile kullanımı
-- Her markanin id'sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

SELECT marka_id, marka_isim,(SELECT COUNT(sehir)
						   FROM calisanlar3
						   WHERE isyeri=marka_isim) AS sehir_sayisi
FROM markalar --correlated subquery

--SELECT DISTINCT (sehir) FROM calisanlar3; --sadece farklı olanları listeler.

--view olşturma
CREATE VIEW marka_sehir_sayisi AS
SELECT marka_id, marka_isim, (SELECT COUNT(DISTINCT(sehir)) 
							  FROM calisanlar3 
							  WHERE isyeri=marka_isim) AS sehir_sayisi
FROM markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,(SELECT MAX(maas) FROM calisanlar3 WHERE isyeri=marka_isim) max_maas
FROM markalar;











--24-b-SUBQUERY: SELECT komutundan sonra kullanımı


--25-EXISTS Cond.



CREATE TABLE mart
(     
urun_id int,      
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(     
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

--Mart ayında 'Toyota' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.

SELECT *
FROM nisan
WHERE EXISTS (SELECT urun_isim FROM mart WHERE urun_isim='Toyota')

--Mart ayında 'Volvo' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.
SELECT *
FROM nisan
WHERE EXISTS (SELECT urun_isim FROM mart WHERE urun_isim='Volvo')

--Mart ayında satılan ürünün urun_id ve musteri_isim'lerini, eğer Nisan ayında da satılmışsa, listeleyen bir sorgu yazınız.

SELECT urun_id,musteri_isim
FROM mart
WHERE EXISTS (SELECT urun_isim FROM nisan WHERE nisan.urun_isim=mart.urun_isim)




