/*
    Варианты частых запросов для созданных индексов:
    1. index_application_created_at - сортировка откликов на вакансию от новых к старым
    2. index_vacancies_by_specialization - поиск вакансий по специальности
    3. index_desired_salary_in_resumes - анализ желаемой зарплаты в резюме
    4. index_salary_by_specializations - анализ зарплаты по специальностям
    5. index_vacancies_by_areas - анализ вакансий по регионам
    6. index_users_created_at - подсчёт новых пользователей за определённый период
 */

CREATE INDEX index_application_created_at ON applications(resume_id, created_at);
CREATE INDEX index_vacancies_by_specialization ON vacancies(vacancy_id, specialization_id);
CREATE INDEX index_desired_salary_in_resumes ON resumes(resume_id, desired_salary);
CREATE INDEX index_salary_by_specializations ON vacancies(specialization_id, compensation_from, compensation_to);
CREATE INDEX index_vacancies_by_areas ON vacancies(area_id, vacancy_id);
CREATE INDEX index_users_created_at ON users(user_id, created_at);