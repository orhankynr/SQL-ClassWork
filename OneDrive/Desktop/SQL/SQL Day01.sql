--TEK YORUM SAIRI
/*ÇOKLU YORUM SATIRI */
---------------------------DAY'1 NT-----------------------
--1- database komutu oluşturma--DDL komutu içinde
CREATE DATABASE deniz; -- sql komutlarında büyük küçük harf duyarlılığı yoktur.
create database deniz2;
--database silme--DDL komutu içinde
DROP DATABASE deniz2;

--3-table oluşturma
CREATE TABLE students(
id CHAR(4),
name VARCHAR(20),
grade REAL,
register_date DATE
);

--4-Mmevcu bir tablodan yeni bir tablo oluşturma
CREATE TABLE grades AS SELECT name,grade FROM students;

--5-tabloya data ekleme-- DML
INSERT INTO students VALUES('1001','Sherlock Holmes',99.8,'2023-10-03');
INSERT INTO students VALUES('1002','Harry Potter',100.0,now());
--6-tablodaki tüm kayıtları (dataları) görüntüleme-- DQL
SELECT * FROM students;
--7-tablodaki bazı sütünlara data ekleme
INSERT INTO students(name,grade) VALUES('Jack Sparrow',88.8);

--8-tabloda belirli sütunlardaki datalari görüntüleme
SELECT namer,grade FROM students;


--PRACTİCE
--grades tabloyu silelim
--4. adımı tekrar yapalım
--tabloyu görüntüleme


--HOMEWORK-1--
--DAY 1 ödev çözümleri--
​
1) Tablo Oluşturma
​
“tedarikciler” isminde bir tablo olusturun,
“tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres”
ve “ulasim_tarihi”	field’lari olsun. 
​
CREATE TABLE tedarikciler(
tedarikci_id INT ,
tedarikci_ismi VARCHAR(50), 
tedarikci_adres VARCHAR(50),
ulasim_tarihi VARCHAR(50)
);
​
2) Var olan tablodan yeni tablo olusturmak 
 “tedarikci_info” isminde bir tabloyu  “tedarikciler” tablosundan olusturun.
Icinde “tedarikci_ismi”, “ulasim_tarihi” field’lari olsun
​
CREATE TABLE tedarikci_info 
AS SELECT tedarikci_ismi,ulasim_tarihi
FROM tedarikciler;
​
3) Data ekleme
“ ogretmenler” isminde tablo olusturun.
 Icinde “kimlik_no”, “isim”, “brans” ve “cinsiyet” field’lari olsun.
“ogretmenler” tablosuna bilgileri asagidaki gibi olan kisileri ekleyin.
kimlik_no: 234431223, isim: Ayse Guler, brans : Matematik, cinsiyet: kadin.
kimlik_no: 234431224, isim: Ali Guler, brans : Fizik, cinsiyet: erkek.
​
CREATE TABLE ogretmenler(
kimlik_no int,
isim varchar(50),
brans varchar(20),
cinsiyet char(5)
);
​
INSERT INTO  ogretmenler VALUES(234431223,'Ayse Guler','Matematik','kadin');
INSERT INTO  ogretmenler VALUES(234431224,'Ali Guler','Fizik','erkek');
​
4) bazı fieldları olan kayıt ekleme
“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
kimlik_no: 567597624, isim: Veli Guler
​
INSERT INTO ogretmenler(kimlik_no,isim) VALUES('567597624','Veli Guler');








































