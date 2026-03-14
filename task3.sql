-- Написать запрос для получения средних значений по регионам (area_id) следующих величин:
-- compensation_from, compensation_to, среднее_арифметическое_from_и_to

SELECT areas.area_id,
       AVG(vacancies.compensation_from) as avg_compensation_from,
       AVG(vacancies.compensation_to) avg_compensation_to,
       AVG((vacancies.compensation_from + vacancies.compensation_to) / 2) as avg_compesation_from_to
FROM vacancies
         JOIN areas ON areas.area_id = vacancies.area_id
GROUP BY areas.area_id
ORDER BY area_id