-- Написать запрос для получения месяца с наибольшим количеством вакансий и месяца с наибольшим
-- количеством резюме

(SELECT COUNT(vacancies.vacancy_id) AS vacancies_count,
       EXTRACT(MONTH FROM vacancies.created_at) AS month,
       EXTRACT(YEAR FROM vacancies.created_at) AS year
FROM vacancies
GROUP BY EXTRACT(MONTH FROM vacancies.created_at),
         EXTRACT(YEAR FROM vacancies.created_at)
ORDER BY vacancies_count DESC LIMIT 1)
UNION
(SELECT COUNT(resumes.resume_id) AS resumes_count,
       EXTRACT(MONTH FROM resumes.created_at) as month,
       EXTRACT(YEAR FROM resumes.created_at) as year
FROM resumes
GROUP BY EXTRACT(MONTH FROM resumes.created_at),
         EXTRACT(YEAR FROM resumes.created_at)
ORDER BY resumes_count DESC limit 1)
