**SQL_EX.RU**  
**БД "КОМПЬЮТЕРНАЯ ФИРМА"**
```
Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price (в долларах). Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.  
```
**БД КОРАБЛИ**  
```
Рассматривается БД кораблей, участвовавших во второй мировой войне. Имеются следующие отношения:
Classes (class, type, country, numGuns, bore, displacement)
Ships (name, class, launched)
Battles (name, date)
Outcomes (ship, battle, result)
Корабли в «классах» построены по одному и тому же проекту, и классу присваивается либо имя первого корабля, построенного по данному проекту, либо названию класса дается имя проекта, которое не совпадает ни с одним из кораблей в БД. Корабль, давший название классу, называется головным.
Отношение Classes содержит имя класса, тип (bb для боевого (линейного) корабля или bc для боевого крейсера), страну, в которой построен корабль, число главных орудий, калибр орудий (диаметр ствола орудия в дюймах) и водоизмещение ( вес в тоннах). В отношении Ships записаны название корабля, имя его класса и год спуска на воду. В отношение Battles включены название и дата битвы, в которой участвовали корабли, а в отношении Outcomes – результат участия данного корабля в битве (потоплен-sunk, поврежден - damaged или невредим - OK).
Замечания. 1) В отношение Outcomes могут входить корабли, отсутствующие в отношении Ships. 2) Потопленный корабль в последующих битвах участия не принимает.
```
1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
```
SELECT model, speed, hd
FROM pc
WHERE price < 500;
```
2. Найдите производителей принтеров. Вывести: maker
```
SELECT DISTINCT  maker 
FROM product
WHERE type = 'Printer';
```
3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
```
SELECT model, ram, screen
FROM laptop
WHERE price > 1000;
```
4. Найдите все записи таблицы Printer для цветных принтеров.
```
SELECT * 
FROM printer
WHERE color = 'y';
```
5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
```
SELECT model, speed, hd
FROM pc
WHERE (cd = '12x' OR cd = '24x') AND price < 600;
```
6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
```
SELECT DISTINCT maker, speed 
FROM product INNER JOIN laptop ON product.model = laptop.model
WHERE hd >= 10;
```
7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
```
SELECT DISTINCT product.model, price
FROM PC INNER JOIN
Product ON PC.model = Product.model
WHERE maker = 'B'
UNION
SELECT DISTINCT product.model, price
FROM Laptop INNER JOIN
Product ON Laptop.model = Product.model
WHERE maker = 'B'
UNION
SELECT DISTINCT product.model, price
FROM Printer INNER JOIN
Product ON Printer.model = Product.model
WHERE maker = 'B';
```
8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.
```
SELECT DISTINCT maker 
FROM product
WHERE type IN ('pc')
EXCEPT
SELECT maker
FROM product
WHERE type IN ('laptop')
```
9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
```
SELECT DISTINCT Maker
FROM product INNER JOIN pc ON pc.model=product.model
WHERE speed >= 450

```
10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
```
SELECT model, price
FROM printer
WHERE price = (SELECT MAX(price) 
FROM printer)
```
11. Найдите среднюю скорость ПК.
```
SELECT AVG(speed) as Avg_speed
FROM pc;
```
12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
```
SELECT AVG(speed) AS Avg_speed
FROM laptop
WHERE price > 1000
```
13. Найдите среднюю скорость ПК, выпущенных производителем A.
```
SELECT AVG(speed) AS Avg_speed
FROM pc INNER JOIN product ON pc.model = product.model
WHERE maker = 'A'
```  
14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
```
SELECT Ships.class, name, Classes.country AS country
FROM ships INNER JOIN Classes ON Classes.class = Ships.class
WHERE numGuns >= 10;
```
15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
```
SELECT hd
FROM pc
GROUP BY hd
HAVING COUNT(hd)>=2;
```