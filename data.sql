-- Insert data in candidate_enrollment_details, subject_details & candidate_subject

INSERT INTO candidate_enrollment_details (ced_candidate_name, ced_exam_time, ced_from_exam_date, ced_to_exam_date, ced_roll_no) 
VALUES ('Dhiraj Solanki', '07:00-10:00', '2021-03-01', '2021-03-06', 'A1001');
SET @ced_id = LAST_INSERT_ID();

INSERT IGNORE INTO subject_details (subject_name) VALUES ('English');
SET @sd_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, @sd_id);

INSERT IGNORE INTO subject_details (subject_name) VALUES ('Hindi');
SET @sd_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, @sd_id);

INSERT IGNORE INTO subject_details (subject_name) VALUES ('Marathi');
SET @sd_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, @sd_id);

INSERT IGNORE INTO subject_details (subject_name) VALUES ('Social Studies');
SET @sd_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, @sd_id);

INSERT IGNORE INTO subject_details (subject_name) VALUES ('Science');
SET @sd_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, @sd_id);

INSERT IGNORE INTO subject_details (subject_name) VALUES ('Mathamatics');
SET @sd_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, @sd_id);


INSERT INTO candidate_enrollment_details (ced_candidate_name, ced_exam_time, ced_from_exam_date, ced_to_exam_date, ced_roll_no) 
VALUES ('Abcd Efgh', '07:00-10:00', '2021-03-01', '2021-03-06', 'A1002');
SET @ced_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='English'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Hindi'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Marathi'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Social Studies'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Science'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Mathamatics'));


INSERT INTO candidate_enrollment_details (ced_candidate_name, ced_exam_time, ced_from_exam_date, ced_to_exam_date, ced_roll_no) 
VALUES ('Defg Hijk', '07:00-10:00', '2021-03-01', '2021-03-06', 'A1003');
SET @ced_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='English'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Hindi'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Marathi'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Social Studies'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Science'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Mathamatics'));


INSERT INTO candidate_enrollment_details (ced_candidate_name, ced_exam_time, ced_from_exam_date, ced_to_exam_date, ced_roll_no) 
VALUES ('Lmno Pqrs', '07:00-10:00', '2021-03-01', '2021-03-06', 'A1004');
SET @ced_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='English'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Hindi'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Marathi'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Social Studies'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Science'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Mathamatics'));


INSERT INTO candidate_enrollment_details (ced_candidate_name, ced_exam_time, ced_from_exam_date, ced_to_exam_date, ced_roll_no) 
VALUES ('Tuvw xyz', '07:00-10:00', '2021-03-01', '2021-03-06', 'A1005');
SET @ced_id = LAST_INSERT_ID();
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='English'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Hindi'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Marathi'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Social Studies'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Science'));
INSERT INTO candidate_subject (ced_id, sd_id) VALUES(@ced_id, (select sd_id from subject_details where subject_name='Mathamatics'));



-- Insert data in question_paper_details

-- English
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (1, 'English Question 1', 'English Question 1 Option 1', 'English Question 1 Option 2', 'English Question 1 Option 3', 
		'English Question 1 Option 4', 'O1', 25,
		(select sd_id from subject_details where subject_name='English')
	);

INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (2, 'English Question 2', 'English Question 2 Option 1', 'English Question 2 Option 2', 'English Question 2 Option 3', 
		'English Question 2 Option 4', 'O2', 25,
		(select sd_id from subject_details where subject_name='English')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (3, 'English Question 3', 'English Question 3 Option 1', 'English Question 3 Option 2', 'English Question 3 Option 3', 
		'English Question 3 Option 4', 'O3', 25,
		(select sd_id from subject_details where subject_name='English')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (4, 'English Question 4', 'English Question 4 Option 1', 'English Question 4 Option 2', 'English Question 4 Option 3', 
		'English Question 4 Option 4', 'O4', 25,
		(select sd_id from subject_details where subject_name='English')
	);


-- Hindi
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (1, 'Hindi Question 1', 'Hindi Question 1 Option 1', 'Hindi Question 1 Option 2', 'Hindi Question 1 Option 3', 
		'Hindi Question 1 Option 4', 'O1', 25,
		(select sd_id from subject_details where subject_name='Hindi')
	);

INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (2, 'Hindi Question 2', 'Hindi Question 2 Option 1', 'Hindi Question 2 Option 2', 'Hindi Question 2 Option 3', 
		'Hindi Question 2 Option 4', 'O2', 25,
		(select sd_id from subject_details where subject_name='Hindi')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (3, 'Hindi Question 3', 'Hindi Question 3 Option 1', 'Hindi Question 3 Option 2', 'Hindi Question 3 Option 3', 
		'Hindi Question 3 Option 4', 'O3', 25,
		(select sd_id from subject_details where subject_name='Hindi')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (4, 'Hindi Question 4', 'Hindi Question 4 Option 1', 'Hindi Question 4 Option 2', 'Hindi Question 4 Option 3', 
		'Hindi Question 4 Option 4', 'O4', 25,
		(select sd_id from subject_details where subject_name='Hindi')
	);


-- Marathi
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (1, 'Marathi Question 1', 'Marathi Question 1 Option 1', 'Marathi Question 1 Option 2', 'Marathi Question 1 Option 3', 
		'Marathi Question 1 Option 4', 'O1', 25,
		(select sd_id from subject_details where subject_name='Marathi')
	);

INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (2, 'Marathi Question 2', 'Marathi Question 2 Option 1', 'Marathi Question 2 Option 2', 'Marathi Question 2 Option 3', 
		'Marathi Question 2 Option 4', 'O2', 25,
		(select sd_id from subject_details where subject_name='Marathi')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (3, 'Marathi Question 3', 'Marathi Question 3 Option 1', 'Marathi Question 3 Option 2', 'Marathi Question 3 Option 3', 
		'Marathi Question 3 Option 4', 'O3', 25,
		(select sd_id from subject_details where subject_name='Marathi')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (4, 'Marathi Question 4', 'Marathi Question 4 Option 1', 'Marathi Question 4 Option 2', 'Marathi Question 4 Option 3', 
		'Marathi Question 4 Option 4', 'O4', 25,
		(select sd_id from subject_details where subject_name='Marathi')
	);


-- Social Studies
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (1, 'Social Studies Question 1', 'Social Studies Question 1 Option 1', 'Social Studies Question 1 Option 2', 'Social Studies Question 1 Option 3', 
		'Social Studies Question 1 Option 4', 'O1', 25,
		(select sd_id from subject_details where subject_name='Social Studies')
	);

INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (2, 'Social Studies Question 2', 'Social Studies Question 2 Option 1', 'Social Studies Question 2 Option 2', 'Social Studies Question 2 Option 3', 
		'Social Studies Question 2 Option 4', 'O2', 25,
		(select sd_id from subject_details where subject_name='Social Studies')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (3, 'Social Studies Question 3', 'Social Studies Question 3 Option 1', 'Social Studies Question 3 Option 2', 'Social Studies Question 3 Option 3', 
		'Social Studies Question 3 Option 4', 'O3', 25,
		(select sd_id from subject_details where subject_name='Social Studies')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (4, 'Social Studies Question 4', 'Social Studies Question 4 Option 1', 'Social Studies Question 4 Option 2', 'Social Studies Question 4 Option 3', 
		'Social Studies Question 4 Option 4', 'O4', 25,
		(select sd_id from subject_details where subject_name='Social Studies')
	);
	
	
-- Science
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (1, 'Science Question 1', 'Science Question 1 Option 1', 'Science Question 1 Option 2', 'Science Question 1 Option 3', 
		'Science Question 1 Option 4', 'O1', 25,
		(select sd_id from subject_details where subject_name='Science')
	);

INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (2, 'Science Question 2', 'Science Question 2 Option 1', 'Science Question 2 Option 2', 'Science Question 2 Option 3', 
		'Science Question 2 Option 4', 'O2', 25,
		(select sd_id from subject_details where subject_name='Science')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (3, 'Science Question 3', 'Science Question 3 Option 1', 'Science Question 3 Option 2', 'Science Question 3 Option 3', 
		'Science Question 3 Option 4', 'O3', 25,
		(select sd_id from subject_details where subject_name='Science')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (4, 'Science Question 4', 'Science Question 4 Option 1', 'Science Question 4 Option 2', 'Science Question 4 Option 3', 
		'Science Question 4 Option 4', 'O4', 25,
		(select sd_id from subject_details where subject_name='Science')
	);
	

-- Mathamatics
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (1, 'Mathamatics Question 1', 'Mathamatics Question 1 Option 1', 'Mathamatics Question 1 Option 2', 'Mathamatics Question 1 Option 3', 
		'Mathamatics Question 1 Option 4', 'O1', 25,
		(select sd_id from subject_details where subject_name='Mathamatics')
	);

INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (2, 'Mathamatics Question 2', 'Mathamatics Question 2 Option 1', 'Mathamatics Question 2 Option 2', 'Mathamatics Question 2 Option 3', 
		'Mathamatics Question 2 Option 4', 'O2', 25,
		(select sd_id from subject_details where subject_name='Mathamatics')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (3, 'Mathamatics Question 3', 'Mathamatics Question 3 Option 1', 'Mathamatics Question 3 Option 2', 'Mathamatics Question 3 Option 3', 
		'Mathamatics Question 3 Option 4', 'O3', 25,
		(select sd_id from subject_details where subject_name='Mathamatics')
	);
	
INSERT INTO question_paper_details (
		qpd_question_number, qpd_question, qpd_question_answer_option1, qpd_question_answer_option2, qpd_question_answer_option3, 
		qpd_question_answer_option4, qpd_question_correct_answer, qpd_marks_allotted, sd_id
	) 
VALUES (4, 'Mathamatics Question 4', 'Mathamatics Question 4 Option 1', 'Mathamatics Question 4 Option 2', 'Mathamatics Question 4 Option 3', 
		'Mathamatics Question 4 Option 4', 'O4', 25,
		(select sd_id from subject_details where subject_name='Mathamatics')
	);
	


-- Insert data in candidate_question

-- Candidate1
INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='English Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='English Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='English Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='English Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='HIndi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='HIndi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='HIndi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='HIndi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Marathi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Marathi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Marathi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Marathi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Science Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Science Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Science Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Science Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 1), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 4'));



-- Candidate2
INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='English Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='English Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='English Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='English Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='HIndi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='HIndi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='HIndi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='HIndi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Marathi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Marathi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Marathi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Marathi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Science Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Science Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Science Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Science Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 2), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 4'));


-- Candidate3
INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='English Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='English Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='English Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='English Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='HIndi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='HIndi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='HIndi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='HIndi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Marathi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Marathi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Marathi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Marathi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Science Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Science Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Science Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Science Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 3), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 4'));



-- Candidate4
INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='English Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='English Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='English Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='English Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='HIndi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='HIndi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='HIndi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='HIndi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Marathi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Marathi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Marathi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Marathi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Science Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Science Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Science Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Science Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 4), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 4'));


-- Candidate5
INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='English Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='English Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='English Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='English Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='HIndi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='HIndi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='HIndi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='HIndi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Marathi Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Marathi Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Marathi Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Marathi Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Social Studies Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Science Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Science Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Science Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Science Question 4'));



INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 1'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 2'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 3'));

INSERT INTO candidate_question (ced_id, qpd_id) 
VALUES((select ced_id from candidate_enrollment_details where ced_id = 5), (select qpd_id from question_paper_details where qpd_question='Mathamatics Question 4'));



-- Insert data in user_profile

INSERT INTO user_profile (username, password, role, enabled) 
VALUES ((select ced_roll_no from candidate_enrollment_details where ced_id = 1), 'asdf1234', 'USER', 1);

INSERT INTO user_profile (username, password, role, enabled) 
VALUES ((select ced_roll_no from candidate_enrollment_details where ced_id = 2), 'asdf1234', 'USER', 1);

INSERT INTO user_profile (username, password, role, enabled) 
VALUES ((select ced_roll_no from candidate_enrollment_details where ced_id = 3), 'asdf1234', 'USER', 1);

INSERT INTO user_profile (username, password, role, enabled) 
VALUES ((select ced_roll_no from candidate_enrollment_details where ced_id = 4), 'asdf1234', 'USER', 1);

INSERT INTO user_profile (username, password, role, enabled) 
VALUES ((select ced_roll_no from candidate_enrollment_details where ced_id = 5), 'asdf1234', 'USER', 1);