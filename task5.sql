-- Написать запрос для получения id и title вакансий, которые собрали больше 5 откликов в первую неделю после
-- публикации

SELECT vacancies.vacancy_id,
       vacancies.vacancy_title
FROM applications
         JOIN vacancies ON vacancies.vacancy_id = applications.vacancy_id
WHERE applications.created_at BETWEEN vacancies.created_at AND vacancies.created_at + interval '7 days'
GROUP BY vacancies.vacancy_id, vacancies.vacancy_title
HAVING COUNT(applications.application_id) > 5
