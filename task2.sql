WITH test_data(area_name) AS (
    SELECT
        'Area ' || generate_series(1,200)
)
INSERT INTO areas(area_name)
SELECT area_name
FROM test_data;



WITH test_data(specialization_name) AS (
    SELECT
        'Профессия ' || generate_series(1,10000)
)
INSERT INTO specializations(specialization_name)
SELECT specialization_name
FROM test_data;



WITH test_data AS (
    SELECT
        'Имя' || generate_series(1,1000000) AS first_name,
        'Фамилия' || generate_series(1,1000000) AS last_name,
        md5(random()::text) AS password_hash,
        '+7' || (10000000 + (random()*89999999)::int) AS user_phone,
        'user' || generate_series(1,1000000) || '@mail.com' AS user_email,
        (ARRAY['applicant','employer'])[floor(random()*2)+1] AS user_role
)
INSERT INTO users(
    first_name,
    last_name,
    password_hash,
    user_phone,
    user_email,
    user_role
)
SELECT
    first_name,
    last_name,
    password_hash,
    user_phone,
    user_email,
    user_role
FROM test_data;



WITH test_data AS (
    SELECT
        'Компания ' || generate_series(1,10000) AS company_name,
        'Описание компании ' || generate_series(1,10000) AS company_description,
        'https://company' || generate_series(1,10000) || '.com' AS company_website,
        generate_series(1,200) AS area_id
)
INSERT INTO companies(
    company_name,
    company_description,
    company_website,
    area_id
)
SELECT
    company_name,
    company_description,
    company_website,
    area_id
FROM test_data;



WITH test_data AS (
    SELECT
        'Вакансия ' || generate_series(1,100000) AS vacancy_title,
        'Описание вакансии ' || generate_series(1,100000) AS vacancy_description,
        (random()*9999 + 1)::int AS specialization_id,
        (random()*2000 + 500)::numeric(10,2) AS compensation_from,
        (random()*4000 + 2000)::numeric(10,2) AS compensation_to,
        (ARRAY['junior','middle','senior'])[floor(random()*3)+1] AS experience_level,
        generate_series(1,200) AS area_id,
        generate_series(1,10000) AS company_id
)
INSERT INTO vacancies(
    vacancy_title,
    vacancy_description,
    specialization_id,
    compensation_from,
    compensation_to,
    experience_level,
    area_id,
    company_id
)
SELECT
    vacancy_title,
    vacancy_description,
    specialization_id,
    compensation_from,
    compensation_to,
    experience_level,
    area_id,
    company_id
FROM test_data;



WITH test_data AS (
    SELECT
        (random()*999999 + 1)::int AS user_id,
        (random()*199 + 1)::int AS area_id,
        (random()*9999 + 1)::int AS specialization_id,
        'Резюме ' || generate_series(1, 100000) AS resume_title,
        'Описание резюме ' || generate_series(1, 100000) AS resume_description,
        (random()*5000 + 1000)::numeric(10,2) AS desired_salary,
        (ARRAY['junior','middle','senior'])[floor(random()*3)+1] AS experience_level
)
INSERT INTO resumes(
    user_id,
    area_id,
    specialization_id,
    resume_title,
    resume_description,
    desired_salary,
    experience_level
)
SELECT
    user_id,
    area_id,
    specialization_id,
    resume_title,
    resume_description,
    desired_salary,
    experience_level
FROM test_data;



WITH test_data AS (
    SELECT
        generate_series(1, 75000) AS id,
        (random()*99999 + 1)::int AS vacancy_id,
        (random()*99999 + 1)::int AS resume_id
)
INSERT INTO applications(
    vacancy_id,
    resume_id
)
SELECT
    vacancy_id,
    resume_id
FROM test_data;