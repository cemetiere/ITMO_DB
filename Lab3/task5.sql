-- Выведите таблицу со средним возрастом студентов во всех группах (Группа, Средний возраст), 
-- где средний возраст равен максимальному возрасту в группе 1100. 

SELECT У.ГРУППА, AVG(date_part('year', AGE(Л.ДАТА_РОЖДЕНИЯ)))::integer AS "Средний возраст" FROM Н_УЧЕНИКИ У 
JOIN Н_ЛЮДИ Л ON У.ЧЛВК_ИД = Л.ИД 
GROUP BY У.ГРУППА, Л.ДАТА_СМЕРТИ HAVING
CASE WHEN Л.ДАТА_СМЕРТИ < NOW() AND Л.ДАТА_СМЕРТИ iS NOT NULL THEN
    AVG(date_part('year', AGE(Л.ДАТА_РОЖДЕНИЯ, Л.ДАТА_СМЕРТИ)))::integer = ( 
        SELECT MIN(date_part('year', AGE(Л.ДАТА_РОЖДЕНИЯ, Л.ДАТА_РОЖДЕНИЯ)))::integer FROM Н_УЧЕНИКИ У 
        JOIN Н_ЛЮДИ Л ON У.ЧЛВК_ИД = Л.ИД 
        WHERE У.ГРУППА = '1100'
    ) 
ELSE AVG(date_part('year', AGE(Л.ДАТА_РОЖДЕНИЯ)))::integer = ( 
        SELECT MIN(date_part('year', AGE(Л.ДАТА_РОЖДЕНИЯ)))::integer FROM Н_УЧЕНИКИ У 
        JOIN Н_ЛЮДИ Л ON У.ЧЛВК_ИД = Л.ИД 
        WHERE У.ГРУППА = '1100'
    )
END;

