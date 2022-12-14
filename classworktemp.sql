CREATE TABLE cwDepartment(
  department_id NUMBER NOT NULL,
  PRIMARY KEY(department_id),
  department_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE cwSkills(
  skill_id NUMBER NOT NULL,
  PRIMARY KEY(skill_id),
  skill_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE cwProfessor(
  professor_id NUMBER NOT NULL,
  PRIMARY KEY(professor_id),
  social_sec_num VARCHAR(9) NOT NULL CHECK(REGEXP_LIKE(social_sec_num, '^[[:digit:]]{9}$')),
  p_name VARCHAR(50) NOT NULL,
  department_id NUMBER NOT NULL,
  FOREIGN KEY(department_id) REFERENCES cwDepartment(department_id),
  yearly_salary NUMBER(10,4) DEFAULT 0 
);

CREATE TABLE cwCourse(
  course_id NUMBER NOT NULL,
  PRIMARY KEY(course_id),
  course_name VARCHAR(50) NOT NULL UNIQUE CHECK(course_name != ''),
  num_of_students NUMBER DEFAULT 0,
  num_of_credits NUMBER(10,4) NOT NULL
);

CREATE TABLE cwProfSkill(
  rel_id NUMBER NOT NULL,
  PRIMARY KEY(rel_id),
  professor_id NUMBER NOT NULL,
  FOREIGN KEY(professor_id) REFERENCES cwProfessor(professor_id),
  skill_id NUMBER NOT NULL,
  FOREIGN KEY(skill_id) REFERENCES cwSkills(skill_id)
);

CREATE TABLE cwClassPeriod(
  period_id NUMBER NOT NULL,
  PRIMARY KEY(period_id),
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL
);

CREATE TABLE cwRoomType(
  room_type_id NUMBER NOT NULL,
  PRIMARY KEY(room_type_id),
  room_name VARCHAR(20) NOT NULL CHECK(room_name='class-room' OR room_name='office' OR room_name='auditorium' OR room_name='computer-lab')
);

CREATE TABLE cwRoom(
  room_id NUMBER NOT NULL,
  PRIMARY KEY(room_id),
  room_number VARCHAR(10) NOT NULL UNIQUE,
  r_capacity NUMBER DEFAULT 1,
  room_type_id NUMBER NOT NULL,
  FOREIGN KEY(room_type_id) REFERENCES cwRoomType(room_type_id)
);

CREATE TABLE cwProfCourse(
  rel_id NUMBER,
  PRIMARY KEY(rel_id),
  professor_id NUMBER,
  FOREIGN KEY(professor_id) REFERENCES cwProfessor(professor_id),
  course_id NUMBER,
  FOREIGN KEY(course_id) REFERENCES cwCourse(course_id)
);

CREATE TABLE cwAssignment(
  assig_id NUMBER NOT NULL,
  PRIMARY KEY(assig_id),
  room_id NUMBER NOT NULL,
  FOREIGN KEY(room_id) REFERENCES cwRoom(room_id),
  period_id NUMBER NOT NULL,
  FOREIGN KEY(period_id) REFERENCES cwClassPeriod(period_id),
  prof_course_id NUMBER,
  FOREIGN KEY(prof_course_id) REFERENCES cwProfCourse(rel_id)
);

INSERT INTO cwDepartment(DEPARTMENT_ID,DEPARTMENT_NAME)
VALUES(1,'IT-DEP');


INSERT INTO cwDepartment(DEPARTMENT_ID,DEPARTMENT_NAME)
VALUES(2,'PHYSICS-DEP');

INSERT INTO cwDepartment(DEPARTMENT_ID,DEPARTMENT_NAME)
VALUES(3,'MATH-DEP');

INSERT INTO cwSkills(skill_id, skill_name)
VALUES(1,'C++');

INSERT INTO cwSkills(skill_id, skill_name)
VALUES(2,'Physics');

INSERT INTO cwSkills(skill_id, skill_name)
VALUES(3,'MATH');

INSERT INTO cwProfessor(professor_id, social_sec_num,p_name, department_id, yearly_salary)
VALUES(1, '000000000','Rogalski Marek', 1, 60000);

INSERT INTO cwProfessor(professor_id, social_sec_num,p_name, department_id, yearly_salary)
VALUES(2, '000000001','Rafal Zdunczyk', 3, 55000);

INSERT INTO cwProfessor(professor_id, social_sec_num,p_name, department_id, yearly_salary)
VALUES(3, '000000002','Sheldon Kuper', 1, 50000);

INSERT INTO cwCourse(course_id, course_name, num_of_students, num_of_credits)
VALUES(1,'Algorithms C++', 30, 5);

INSERT INTO cwCourse(course_id, course_name, num_of_students, num_of_credits)
VALUES(2,'Math Analysis', 35, 5);

INSERT INTO cwCourse(course_id, course_name, num_of_students, num_of_credits)
VALUES(3,'Dark Holes', 35, 6);

INSERT INTO cwProfSkill(rel_id,professor_id,skill_id)
VALUES(1, 1, 1);

INSERT INTO cwProfSkill(rel_id,professor_id,skill_id)
VALUES(2, 2, 3);


INSERT INTO cwProfSkill(rel_id,professor_id,skill_id)
VALUES(3, 3, 2);

INSERT INTO cwClassPeriod(period_id,start_time, end_time)
VALUES(1,timestamp '2022-12-12 12:30:00',timestamp '2022-12-12 14:30:00');

INSERT INTO cwClassPeriod(period_id,start_time, end_time)
VALUES(2,timestamp '2022-12-12 14:30:00',timestamp '2022-12-12 16:30:00');

INSERT INTO cwClassPeriod(period_id,start_time, end_time)
VALUES(3,timestamp '2022-12-12 08:30:00',timestamp '2022-12-12 09:30:00');

INSERT INTO cwRoomType(
room_type_id,
room_name)
VALUES(1,'class-room');

INSERT INTO cwRoomType(
room_type_id,
room_name)
VALUES(2,'office');


INSERT INTO cwRoomType(
room_type_id,
room_name)
VALUES(3,'auditorium');

INSERT INTO cwRoomType(
room_type_id,
room_name)
VALUES(4,'class-room');

INSERT INTO cwRoom(
    room_id,
    room_number,
    r_capacity,
    room_type_id
)
VALUES(
    1,
    'A101',
    30,
    1
);

INSERT INTO cwRoom(
    room_id,
    room_number,
    r_capacity,
    room_type_id
)
VALUES(
    2,
    'A102',
    5,
    2
);

INSERT INTO cwRoom(
    room_id,
    room_number,
    r_capacity,
    room_type_id
)
VALUES(
    3,
    'A103',
    100,
    3
);

INSERT INTO cwRoom(
    room_id,
    room_number,
    r_capacity,
    room_type_id
)
VALUES(
    4,
    'A104',
    40,
    4
);

INSERT INTO cwProfCourse(
rel_id,
professor_id,
course_id)
VALUES (1,1,1);

INSERT INTO cwProfCourse(
rel_id,
professor_id,
course_id)
VALUES(2,2,2);

INSERT INTO cwProfCourse(
rel_id,
professor_id,
course_id)
VALUES(3,3,3);

INSERT INTO cwAssignment(
assig_id, 
room_id,
period_id,
prof_course_id)
VALUES(1, 1, 2, 1);


INSERT INTO cwAssignment(
assig_id, 
room_id,
period_id,
prof_course_id)
VALUES(2, 2, 3, 2);


INSERT INTO cwAssignment(
assig_id, 
room_id,
period_id,
prof_course_id)
VALUES(3, 3, 1, 3);

SELECT * FROM cwProfessor;

SELECT MAX(yearly_salary) as MAXSAL FROM cwProfessor;

SELECT p_name FROM cwProfessor WHERE p_name LIKE 'R%';

SELECT pr.p_name FROM cwAssignment asg
LEFT JOIN cwProfCourse pc ON pc.rel_id = asg.prof_course_id
LEFT JOIN cwProfessor pr ON pc.professor_id = pr.professor_id;

SELECT skill_name FROM cwSkills
ORDER BY skill_name DESC;

SELECT DISTINCT r_capacity FROM cwRoom;

SELECT p_name FROM cwProfessor WHERE
professor_id IN (SELECT professor_id FROM cwProfSkill WHERE skill_id = (SELECT skill_id FROM cwSkills WHERE skill_name = 'C++')); 

SELECT room_number FROM cwRoom 
WHERE room_id IN (SELECT room_id FROM cwAssignment WHERE period_id IN (2,3));

SELECT dp.department_name, AVG(pf.yearly_salary) FROM cwDepartment dp
LEFT JOIN cwProfessor pf ON(pf.department_id = dp.department_id)
GROUP BY dp.department_name;

SELECT pf.p_name, COUNT(r.rel_id) FROM cwProfessor pf
LEFT JOIN cwProfCourse r ON r.professor_id = pf.professor_id
GROUP BY pf.p_name;

SELECT p_name FROM cwProfessor 
where p_name LIKE '%o%';

SELECT cr.course_name, per.end_time - per.start_time FROM cwAssignment asg
JOIN cwProfCourse pfc ON pfc.rel_id = asg.prof_course_id
JOIN cwCourse cr ON cr.course_id = pfc.course_id
JOIN cwClassPeriod per ON asg.period_id = per.period_id;