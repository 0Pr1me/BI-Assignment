-- please remember to give a meaningful name to both Table X (instead of tb_x) and TableY (instead of tb_y)

-- Make the A1's stg_xxx schema the default for this session
SET search_path TO stg_033;

-- -------------------------------
-- 2) DROP TABLE before attempting to create OLTP snapshot tables
-- -------------------------------
DROP TABLE IF EXISTS tb_y;
DROP TABLE IF EXISTS tb_x;

-- Table X: Defines the mentorship programs
CREATE TABLE tb_mentorship_program (
    id INT NOT NULL PRIMARY KEY,
    program_name VARCHAR(255) NOT NULL,
    program_focus VARCHAR(255),
    default_duration_weeks INT
);

-- Table Y: Links employees (mentors/mentees) to programs
CREATE TABLE tb_mentorship_link (
    id INT NOT NULL PRIMARY KEY,
    program_id INT NOT NULL,
    mentor_employeeid INT NOT NULL,
    mentee_employeeid INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE, -- Nullable, to allow for active mentorships

    -- Foreign key constraints
    CONSTRAINT fk_program
        FOREIGN KEY(program_id) 
        REFERENCES tb_mentorship_program(id),
    CONSTRAINT fk_mentor
        FOREIGN KEY(mentor_employeeid) 
        REFERENCES tb_employee(id),
    CONSTRAINT fk_mentee
        FOREIGN KEY(mentee_employeeid) 
        REFERENCES tb_employee(id)
);

