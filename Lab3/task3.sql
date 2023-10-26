-- Вывести число студентов вечерней формы обучения, которые младше 20 лет. 
-- Ответ должен содержать только одно число. 

SELECT COUNT(*) FROM Н_ЛЮДИ Л  
JOIN Н_УЧЕНИКИ У ON Л.ИД = У.ЧЛВК_ИД  
JOIN Н_ПЛАНЫ П ON У.ПЛАН_ИД = П.ИД  
WHERE П.ФО_ИД = 2 AND date_part('year', age(Л.ДАТА_РОЖДЕНИЯ))<20; 