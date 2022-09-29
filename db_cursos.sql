CREATE TABLE "users" (
  "user_id" int PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "id_roles" int NOT NULL
);

CREATE TABLE "courses" (
  "course_id" int PRIMARY KEY,
  "title" varchar UNIQUE NOT NULL,
  "description" varchar UNIQUE NOT NULL,
  "level_id" int NOT NULL,
  "teacher_id" int NOT NULL,
  "id_categories" int NOT NULL
);

CREATE TABLE "categories" (
  "categorie_id" int PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "roles" (
  "role_id" int PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "levels" (
  "level_id" int PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "course_videos" (
  "course_videos_id" int,
  "course_id" int,
  "title" varchar UNIQUE NOT NULL,
  "url" varchar UNIQUE NOT NULL,
  PRIMARY KEY ("course_videos_id", "course_id")
);

CREATE TABLE "students" (
  "student_id" int PRIMARY KEY,
  "id_user" int
);

CREATE TABLE "teachers" (
  "teacher_id" int PRIMARY KEY,
  "id_user" int UNIQUE NOT NULL,
  "course_id" int UNIQUE
);

CREATE TABLE "students_courses" (
  "students_id" int,
  "course_id" int,
  "percent_complete" varchar(4) not null,
  "review" varchar not null,
  PRIMARY KEY ("students_id", "course_id")
);

ALTER TABLE "courses" ADD FOREIGN KEY ("id_categories") REFERENCES "categories" ("categorie_id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("level_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id_roles") REFERENCES "roles" ("role_id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("teacher_id");

ALTER TABLE "teachers" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("course_id");

ALTER TABLE "teachers" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("user_id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("course_id");

ALTER TABLE "students" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("user_id");

ALTER TABLE "students_courses" ADD FOREIGN KEY ("students_id") REFERENCES "students" ("student_id");

ALTER TABLE "students_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("course_id");

insert into users(
user_id,
name,
email,
password,
age,
id_roles
)values(
1,
'jose alejandro',
'josealejandro@yop.com',
'Jose123',
23,
2
),
(
2,
'david',
'david@yop.com',
'David123',
20,
2
),
(
3,
'maria',
'maria@yop.com',
'Maria123',
21,
2
),
(
4,
'pablo',
'pablo@yop.com',
'Pablo123',
32,
1
),
(
5,
'alexandra',
'alexandra@yop.com',
'Alexandra123',
27,
1
),
(
6,
'mario',
'mario@yop.com',
'mario123',
19,
2
),(
7,
'marcos',
'marcos@yop.com',
'Marcos123',
36,
1
);

insert into roles (
role_id,
name
)values(
1,
'teacher'
),
(
2,
'student'
),
(
3,
'admin'
);

insert into teachers (
teacher_id,
id_user,
course_id 
)values(
1,
4,
1
),
(
2,
5,
2
),
(
3,
7,
3
);

insert into categories (
categorie_id,
name 
)values(
1,
'front-end'
),
(
2,
'back-end'
);

insert into levels (
level_id,
name 
)values(
1,
'beginner'
),
(
2,
'intermediate'
),
(
3,
'advanced'
);
insert into students (
student_id,
id_user 
)values(
1,
1
),
(
2,
2
),
(
3,
3
),
(
4,
6
);

insert into courses(
course_id,
title,
description,
level_id,
teacher_id,
id_categories
)values
(
1,
'fundamentals',
'In this course you will see the fundamentals of html, css and javascript',
1,
1,
1
),
(
2,
'react',
'In this module we will learn and delve a little more into the world of web development with react',
2,
2,
1
),
(
3,
'node js',
'In this module we will work on the back side and we will see everything about the databases',
3,
3,
3
);
insert into course_videos (
course_videos_id,
course_id,
title,
url
)values(
1,
1,
'fundamentals class 1',
'https//fundamentals/class/1'
),
(
2,
1,
'fundamentals class 2',
'https//fundamentals/class/2'
),
(
3,
1,
'fundamentals class 3',
'https//fundamentals/class/3'
),
(
1,
2,
'react class 1',
'https//react/class/1'
),
(
1,
3,
'node-js class 1',
'https//nodejs/class/1'
);

insert into students_courses (
students_id,
course_id,
percent_complete,
review
)values(
1,
1,
'85%',
'the student presents a high performance and a quick comprehension of the topic, 
suitable to advance to the next module while finishing this one'
),
(
1,
2,
'22%',
'the student presents good performance, rapid understanding of the subject'
),
(
2,
1,
'65%',
'the student presents good performance, rapid understanding of the subject'
),
(
3,
2,
'45%',
'the student presents good performance, rapid understanding of the subject'
),
(
4,
3,
'52%',
'the student has low performance, it is difficult for him to understand the subject, 
but he is participatory, responsible and inquiring'
);
select students.student_id, users.name, users.email, users.age, courses.title, students_courses.percent_complete 
from students 
inner join users 
on students.student_id=users.user_id
inner join students_courses
on students_courses.students_id = students.student_id
inner join courses
on courses.course_id = students_courses.course_id








