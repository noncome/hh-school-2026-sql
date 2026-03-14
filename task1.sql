create table users(
    user_id integer GENERATED ALWAYS AS IDENTITY primary key,
    first_name text not null,
    last_name text not null,
    password_hash varchar not null,
    user_phone text,
    user_email text not null unique,
    user_role text,
    created_at timestamp default now() - random() * interval '5 years'
);

create table specializations(
    specialization_id integer GENERATED ALWAYS AS IDENTITY primary key,
    specialization_name text not null
);

create table areas(
    area_id integer GENERATED ALWAYS AS IDENTITY primary key,
    area_name text not null
);

create table companies(
    company_id integer GENERATED ALWAYS AS IDENTITY primary key,
    company_name text not null,
    company_description text,
    company_website text,
    area_id integer references areas(area_id),
    created_at timestamp default now() - random() * interval '5 years'
);

create table vacancies(
    vacancy_id integer GENERATED ALWAYS AS IDENTITY primary key,
    vacancy_title text not null,
    vacancy_description text not null,
    specialization_id integer references specializations(specialization_id),
    compensation_from numeric(10, 2),
    compensation_to numeric(10, 2),
    created_at timestamp default now() - random() * interval '5 years',
    experience_level text,
    area_id integer references areas(area_id),
    company_id integer references companies(company_id)
);

create table resumes(
    resume_id integer GENERATED ALWAYS AS IDENTITY primary key,
    user_id integer references users(user_id),
    area_id integer references areas(area_id),
    specialization_id integer references specializations(specialization_id),
    resume_title text not null,
    resume_description text,
    desired_salary numeric(10, 2),
    experience_level text,
    created_at timestamp default now() - random() * interval '5 years'
);

create table applications(
    application_id integer GENERATED ALWAYS AS IDENTITY primary key,
    vacancy_id integer references vacancies(vacancy_id),
    resume_id integer references resumes(resume_id),
    created_at timestamp default now() - random() * interval '5 years'
);

