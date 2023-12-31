-- Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям: 
-- Таблицы: Н_ЛЮДИ, Н_СЕССИЯ. 
-- Вывести атрибуты: Н_ЛЮДИ.ОТЧЕСТВО, Н_СЕССИЯ.ИД. 
-- Фильтры (AND): 
-- a) Н_ЛЮДИ.ИД > 100012. 
-- b) Н_СЕССИЯ.ИД < 14369. 
-- c) Н_СЕССИЯ.ИД > 14369. 
-- Вид соединения: INNER JOIN. 

SELECT Л.ОТЧЕСТВО, С.ИД FROM Н_ЛЮДИ Л  
JOIN Н_СЕССИЯ С ON Л.ИД = С.ЧЛВК_ИД  
WHERE Л.ИД >100012 AND С.ИД<14369 AND С.ИД>14369; 