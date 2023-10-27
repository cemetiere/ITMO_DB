SELECT * FROM Н_УЧЕНИКИ У
JOIN Н_ЛЮДИ Л ON Л.ИД = У.ЧЛВК_ИД
WHERE ЧЛВК_ИД IN (
    SELECT ИД from Н_ЛЮДИ
    WHERE ФАМИЛИЯ IN (
        SELECT ФАМИЛИЯ FROM Н_ЛЮДИ
        GROUP BY ФАМИЛИЯ HAVING COUNT(ФАМИЛИЯ) > 1
    )
    AND ИД IN (
        SELECT ИД FROM Н_ЛЮДИ
        GROUP BY ИД HAVING COUNT(ИД) = 1
    )
);