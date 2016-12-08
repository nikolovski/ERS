/*

  EXPENSE REIMBURSEMENT SYSTEM

            .--.  ,---.  _______ ,-..-. .-. .---.
  |\    /| / /\ \ | .-.\|__   __||(||  \| |/ .-. )
  |(\  / |/ /__\ \| `-'/  )| |   (_)|   | || | |(_)
  (_)\/  ||  __  ||   (  (_) |   | || |\  || | | |
  | \  / || |  |)|| |\ \   | |   | || | |)|\ `-' /
  | |\/| ||_|  (_)|_| \)\  `-'   `-'/(  (_) )---'
  '-'  '-'            (__)         (__)    (_)

  Author: Martino Nikolovski
*/

/*================================================================================*/
--                   Creating a new tablespace for the ER System                  --
/*================================================================================*/
CREATE USER ers
IDENTIFIED BY Choose69Cry;

GRANT DBA TO ers;


/*================================================================================*/
--                         Creating tables for the ER System                      --
/*================================================================================*/

CREATE TABLE ers_reimbursement (
  reimb_id          NUMBER    NOT NULL,
  reimb_amount      NUMBER    NOT NULL,
  reimb_submitted   TIMESTAMP NOT NULL,
  reimb_resolved    TIMESTAMP,
  reimb_description VARCHAR2(250),
  reimb_receipt     BLOB,
  reimb_author      NUMBER    NOT NULL,
  reimb_resolver    NUMBER,
  reimb_status_id   NUMBER    NOT NULL,
  reimb_type_id     NUMBER    NOT NULL,
  CONSTRAINT ers_reimbursement_pk PRIMARY KEY (reimb_id)
);

-- Current reimbursement statuses: APPROVED, PENDING and DENIED
CREATE TABLE ers_reimbursement_status (
  reimb_status_id NUMBER       NOT NULL,
  reimb_status    VARCHAR2(10) NOT NULL,
  CONSTRAINT reimb_status_pk PRIMARY KEY (reimb_status_id)
);

-- Current reimbursement types: LODGING, TRAVEL, FOOD or OTHER
CREATE TABLE ers_reimbursement_type (
  reimb_type_id NUMBER       NOT NULL,
  reimb_type    VARCHAR2(10) NOT NULL,
  CONSTRAINT reimb_type_pk PRIMARY KEY (reimb_type_id)
);

CREATE TABLE ers_users (
  ers_users_id    NUMBER        NOT NULL,
  ers_username    VARCHAR2(50)  NOT NULL UNIQUE,
  ers_password    VARCHAR2(100)  NOT NULL,
  user_first_name VARCHAR2(100) NOT NULL,
  user_last_name  VARCHAR2(100) NOT NULL,
  user_email      VARCHAR2(150) NOT NULL UNIQUE,
  user_role_id    NUMBER        NOT NULL,
  CONSTRAINT ers_users_pk PRIMARY KEY (ers_users_id)
);

CREATE TABLE ers_user_roles (
  ers_user_role_id NUMBER       NOT NULL,
  user_role        VARCHAR2(20) NOT NULL,
  CONSTRAINT ers_user_roles_pk PRIMARY KEY (ers_user_role_id)
);

/*================================================================================*/
--                   Creating relationships for the tables above                  --
/*================================================================================*/

-- ERS_REIMBURSEMENT table foreign keys
ALTER TABLE ers_reimbursement
  ADD CONSTRAINT ers_users_fk_auth
FOREIGN KEY (reimb_author)
REFERENCES ers_users (ers_users_id);

ALTER TABLE ers_reimbursement
  ADD CONSTRAINT ers_users_fk_reslvr
FOREIGN KEY (reimb_resolver)
REFERENCES ers_users (ers_users_id);

ALTER TABLE ers_reimbursement
  ADD CONSTRAINT ers_reimbursement_status_fk
FOREIGN KEY (reimb_status_id)
REFERENCES ers_reimbursement_status (reimb_status_id);

ALTER TABLE ers_reimbursement
  ADD CONSTRAINT ers_reimbursement_type_fk
FOREIGN KEY (reimb_type_id)
REFERENCES ers_reimbursement_type (reimb_type_id);

-- ERS_USERS table foreign keys
ALTER TABLE ers_users
  ADD CONSTRAINT user_roles_fk
FOREIGN KEY (user_role_id)
REFERENCES ers_user_roles (ers_user_role_id);


/*================================================================================*/
--                      Populating the tables with mock data                      --
/*================================================================================*/

--Populating ERS_REIMBURSEMENT_STATUS
INSERT INTO ers_reimbursement_status
VALUES (1, 'Approved');
INSERT INTO ers_reimbursement_status
VALUES (2, 'Pending');
INSERT INTO ers_reimbursement_status
VALUES (3, 'Denied');

--Populating ERS_REIMBURSEMENT_TYPE
INSERT INTO ers_reimbursement_type
VALUES (1, 'Lodging');
INSERT INTO ers_reimbursement_type
VALUES (2, 'Travel');
INSERT INTO ers_reimbursement_type
VALUES (3, 'Food');
INSERT INTO ers_reimbursement_type
VALUES (4, 'Other');

--Populating ERS_USER_ROLES
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (1, 'Finance Manager');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (2, 'Office Assistant III');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (3, 'Nurse Practicioner');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (4, 'HR Manager');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (5, 'Project Manager');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (6, 'VP Accounting');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (7, 'Senior Editor');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (8, 'Geological Engineer');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (9, 'Associate Professor');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (10, 'Civil Engineer');
INSERT INTO ers_user_roles (ers_user_role_id, user_role) VALUES (11, 'Web Designer I');

--Populating ERS_USERS
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (1, 'shamilton0', 'LdTPHY', 'Steven', 'Hamilton', 'shamilton0@list-manage.com', 10);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (2, 'edavis1', 'O6SvXdR7BA5', 'Earl', 'Davis', 'edavis1@wiley.com', 6);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (3, 'sbaker2', 'i1D0iG', 'Sharon', 'Baker', 'sbaker2@mtv.com', 2);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (4, 'jgardner3', 'g95W52', 'Janice', 'Gardner', 'jgardner3@indiegogo.com', 1);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (5, 'kallen4', '0LfdkMqgras', 'Kathryn', 'Allen', 'kallen4@google.es', 1);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (6, 'cgutierrez5', 'efKw7QZ6', 'Christopher', 'Gutierrez', 'cgutierrez5@cnn.com', 11);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (7, 'eriley6', '1l9yXrk62aC', 'Elizabeth', 'Riley', 'eriley6@cam.ac.uk', 4);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (8, 'jwood7', 'DlUu2H2Am', 'Johnny', 'Wood', 'jwood7@hao123.com', 6);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (9, 'jdiaz8', 'AeasuTmyyfq', 'Jose', 'Diaz', 'jdiaz8@samsung.com', 4);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (10, 'erichards9', 'kGemtEMcNwiq', 'Edward', 'Richards', 'erichards9@technorati.com', 9);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (11, 'kreida', 'uqnef9ChDX6Q', 'Kathy', 'Reid', 'kreida@fastcompany.com', 9);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (12, 'jcarrb', '5TNabu1ePURN', 'Judith', 'Carr', 'jcarrb@cafepress.com', 9);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (13, 'lortizc', 'YmPtNxKfH1e', 'Larry', 'Ortiz', 'lortizc@globo.com', 7);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (14, 'trodriguezd', 'ZzHgVW6HM8', 'Thomas', 'Rodriguez', 'trodriguezd@vimeo.com', 7);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (15, 'nmurraye', 'Qpy3zJuN', 'Nicholas', 'Murray', 'nmurraye@histats.com', 7);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (16, 'bporterf', '79sQvf2b', 'Brandon', 'Porter', 'bporterf@amazon.co.jp', 10);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (17, 'rramosg', 'IWzShs', 'Ronald', 'Ramos', 'rramosg@newyorker.com', 4);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (18, 'ebakerh', 'b1hR1Ced', 'Evelyn', 'Baker', 'ebakerh@mediafire.com', 4);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (19, 'ctaylori', 'U1cw9Rxh6g', 'Christopher', 'Taylor', 'ctaylori@merriam-webster.com', 2);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (20, 'aruizj', 'fJ4XtkOSGnD', 'Albert', 'Ruiz', 'aruizj@si.edu', 10);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (21, 'lramosk', '2ZIV2Q3h2N6o', 'Lawrence', 'Ramos', 'lramosk@imgur.com', 7);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (22, 'ekingl', 'j4UOSjjr', 'Earl', 'King', 'ekingl@nsw.gov.au', 4);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (23, 'bclarkm', 'AMMnRyMJMQg', 'Bonnie', 'Clark', 'bclarkm@ucoz.ru', 7);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (24, 'ghuntern', 'tL5pkYuV1Cf6', 'George', 'Hunter', 'ghuntern@mit.edu', 11);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (25, 'mbrowno', 'tdaTEqlPwP', 'Mildred', 'Brown', 'mbrowno@woothemes.com', 3);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (26, 'bhillp', 'cB7hlh2oR', 'Bobby', 'Hill', 'bhillp@ed.gov', 9);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (27, 'swilliamsonq', '11iQtzNDIa', 'Stephen', 'Williamson', 'swilliamsonq@hc360.com', 7);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (28, 'gwrightr', '5OETTheQw', 'Gregory', 'Wright', 'gwrightr@marriott.com', 2);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (29, 'apierces', 'eHIA2w7', 'Andrew', 'Pierce', 'apierces@nytimes.com', 3);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (30, 'mfullert', '7NrOZLR8Y98n', 'Marie', 'Fuller', 'mfullert@zimbio.com', 11);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (31, 'acarteru', 'm907JSEYU', 'Anthony', 'Carter', 'acarteru@state.tx.us', 6);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (32, 'mmcdonaldv', 'ouRo5fL', 'Melissa', 'Mcdonald', 'mmcdonaldv@dion.ne.jp', 3);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (33, 'jfrazierw', '02es07', 'Jimmy', 'Frazier', 'jfrazierw@amazon.de', 6);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (34, 'ekennedyx', 'TNyuk1Piwf6O', 'Eric', 'Kennedy', 'ekennedyx@purevolume.com', 10);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (35, 'rpayney', 'I7gd0uv18', 'Robert', 'Payne', 'rpayney@answers.com', 7);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (36, 'drichardsz', 'h24Ldg', 'Debra', 'Richards', 'drichardsz@cargocollective.com', 11);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (37, 'rchavez10', '10mMKHV1gG', 'Roy', 'Chavez', 'rchavez10@ning.com', 9);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (38, 'scarpenter11', 'HCtF2uG', 'Scott', 'Carpenter', 'scarpenter11@nsw.gov.au', 5);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (39, 'rmontgomery12', 'FCnuSP9Cck', 'Richard', 'Montgomery', 'rmontgomery12@creativecommons.org', 2);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (40, 'eharrison13', 'aVoWrj7IX', 'Elizabeth', 'Harrison', 'eharrison13@zdnet.com', 5);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (41, 'eberry14', '0kIACp78', 'Eugene', 'Berry', 'eberry14@dion.ne.jp', 8);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (42, 'wrobinson15', '7kYqiNm2qp', 'Wayne', 'Robinson', 'wrobinson15@bigcartel.com', 4);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (43, 'ewhite16', 'jpi52yJ7e3u', 'Ernest', 'White', 'ewhite16@google.com.hk', 6);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (44, 'mholmes17', 'qDEercZ', 'Martin', 'Holmes', 'mholmes17@census.gov', 1);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (45, 'hmurphy18', '4R8j7zi', 'Harry', 'Murphy', 'hmurphy18@privacy.gov.au', 9);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (46, 'dburke19', 'r1fNw08LHar', 'Denise', 'Burke', 'dburke19@weebly.com', 2);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (47, 'rlawrence1a', 'HkO0DYJIGNm', 'Ronald', 'Lawrence', 'rlawrence1a@home.pl', 1);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (48, 'bwatson1b', 'Jl2aTX', 'Barbara', 'Watson', 'bwatson1b@howstuffworks.com', 4);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (49, 'rbutler1c', 'P89hk0MO', 'Robin', 'Butler', 'rbutler1c@umich.edu', 7);
INSERT INTO ers_users (ers_users_id, ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id)
VALUES (50, 'lgriffin1d', '0riK69MftMj', 'Linda', 'Griffin', 'lgriffin1d@twitter.com', 6);

--Populating ERS_REIMBURSEMENT
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (1, 610.2, TIMESTAMP '2015-12-07 11:22:52', NULL,
        'dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', NULL, 5, 23, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (2, 1246.05, TIMESTAMP '2016-07-13 03:13:15', NULL, NULL, NULL, 23, 13, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (3, 1297.18, TIMESTAMP '2016-06-18 21:37:49', NULL,
        'sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis', NULL, 2, 42, 1,
        1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (4, 1710.83, TIMESTAMP '2016-07-18 01:18:20', NULL,
        'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper',
        NULL, 40, 1, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (5, 67.3, TIMESTAMP '2016-09-23 13:56:22', NULL,
        'pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla', NULL, 16,
        18, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (6, 534.64, TIMESTAMP '2016-05-20 14:53:27', NULL, NULL, NULL, 35, 5, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (7, 80.12, TIMESTAMP '2015-12-04 21:34:59', NULL,
        'vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum',
        NULL, 18, 40, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (8, 253.56, TIMESTAMP '2016-09-22 18:02:40', NULL, 'quam a odio in hac habitasse platea dictumst maecenas ut', NULL,
   48, 33, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (9, 417.78, TIMESTAMP '2016-02-01 04:25:31', NULL,
        'commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor',
        NULL, 20, 49, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (10, 1925.03, TIMESTAMP '2016-08-17 07:28:28', NULL,
        'mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at',
        NULL, 25, 20, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (11, 1431.32, TIMESTAMP '2016-04-29 22:43:02', NULL,
        'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam', NULL, 17, 40, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (12, 1641.06, TIMESTAMP '2016-02-18 18:16:29', NULL,
        'lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu',
        NULL, 41, 6, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (13, 690.9, TIMESTAMP '2016-04-15 13:01:00', NULL, NULL, NULL, 13, 2, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (14, 571.26, TIMESTAMP '2016-03-24 10:56:05', NULL,
        'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin', NULL, 17, 35, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (15, 65.72, TIMESTAMP '2016-02-06 17:17:51', NULL, 'odio justo sollicitudin ut suscipit a feugiat et eros vestibulum',
   NULL, 32, 23, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (16, 177.77, TIMESTAMP '2016-09-04 08:30:10', NULL, 'in tempus sit amet sem fusce consequat nulla nisl nunc', NULL,
   41, 43, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (17, 1739.56, TIMESTAMP '2016-11-22 17:30:04', NULL,
        'ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus', NULL, 11, 5, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (18, 924.55, TIMESTAMP '2016-04-15 10:49:55', NULL,
        'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere',
        NULL, 38, 44, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (19, 1015.27, TIMESTAMP '2016-10-20 13:49:52', NULL, NULL, NULL, 38, 41, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (20, 1167.68, TIMESTAMP '2016-04-13 14:42:37', NULL,
        'nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit',
        NULL, 8, 20, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (21, 1287.39, TIMESTAMP '2016-02-19 22:09:24', NULL,
        'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet', NULL, 37, 47, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (22, 1100.76, TIMESTAMP '2016-09-09 21:16:58', NULL,
        'hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer', NULL, 43, 41, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (23, 714.92, TIMESTAMP '2016-11-12 14:59:15', NULL,
        'etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent', NULL, 12, 46, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (24, 755.36, TIMESTAMP '2016-07-05 15:50:34', NULL,
        'iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla', NULL, 36, 15, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (25, 184.57, TIMESTAMP '2016-10-02 05:52:47', NULL,
        'massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea', NULL, 19, 16, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (26, 838.34, TIMESTAMP '2016-06-13 13:22:34', NULL,
        'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius', NULL, 11, 7, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (27, 1504.44, TIMESTAMP '2016-03-16 08:43:12', NULL,
        'justo eu massa donec dapibus duis at velit eu est congue elementum', NULL, 43, 14, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (28, 272.74, TIMESTAMP '2016-01-05 19:14:06', NULL,
        'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus',
        NULL, 40, 40, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (29, 5.0, TIMESTAMP '2016-08-31 04:49:15', NULL, NULL, NULL, 7, 34, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (30, 1478.92, TIMESTAMP '2016-09-22 04:43:51', NULL,
        'in imperdiet et commodo vulputate justo in blandit ultrices enim', NULL, 21, 31, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (31, 1277.37, TIMESTAMP '2016-08-14 00:15:28', NULL,
        'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', NULL, 18, 38, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (32, 464.2, TIMESTAMP '2016-07-15 02:26:44', NULL, 'lacinia aenean sit amet justo morbi ut odio cras mi', NULL, 3, 10,
   1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (33, 928.98, TIMESTAMP '2016-02-19 18:23:46', NULL,
        'et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque',
        NULL, 11, 48, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (34, 1494.43, TIMESTAMP '2015-12-05 08:08:12', NULL, NULL, NULL, 8, 24, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (35, 1154.74, TIMESTAMP '2016-04-14 23:16:03', NULL, NULL, NULL, 49, 10, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (36, 856.14, TIMESTAMP '2016-09-27 18:44:15', NULL,
        'in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium', NULL, 47, 22, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (37, 46.64, TIMESTAMP '2016-06-03 12:33:57', NULL,
        'morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id', NULL, 40, 8, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (38, 1975.03, TIMESTAMP '2016-03-12 23:36:31', NULL,
        'non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla', NULL, 5, 8, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (39, 752.49, TIMESTAMP '2016-03-06 04:35:04', NULL,
        'vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat', NULL, 20, 3, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (40, 1988.11, TIMESTAMP '2016-11-10 09:10:50', NULL,
        'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula',
        NULL, 17, 30, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (41, 317.12, TIMESTAMP '2016-03-26 00:45:24', NULL,
        'arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis', NULL, 25, 11, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (42, 680.55, TIMESTAMP '2016-08-16 02:31:48', NULL,
        'justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est',
        NULL, 13, 39, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (43, 1286.69, TIMESTAMP '2016-08-16 00:39:33', NULL, 'dolor vel est donec odio justo sollicitudin ut suscipit a',
        NULL, 49, 2, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (44, 1655.59, TIMESTAMP '2016-03-15 08:33:11', NULL,
        'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis', NULL, 37, 48, 1,
        3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (45, 84.82, TIMESTAMP '2015-12-22 14:31:32', NULL,
        'elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum', NULL, 20, 9, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (46, 1493.21, TIMESTAMP '2016-10-25 09:16:07', NULL, NULL, NULL, 18, 36, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (47, 1050.64, TIMESTAMP '2016-06-06 16:53:35', NULL, NULL, NULL, 14, 31, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (48, 857.22, TIMESTAMP '2016-05-03 03:46:38', NULL,
        'at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea', NULL,
        42, 19, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (49, 253.36, TIMESTAMP '2016-07-30 00:34:47', NULL, NULL, NULL, 49, 43, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (50, 254.72, TIMESTAMP '2015-12-10 15:02:12', NULL, NULL, NULL, 1, 14, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (51, 671.67, TIMESTAMP '2016-05-05 00:19:30', NULL, NULL, NULL, 9, 5, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (52, 1855.6, TIMESTAMP '2016-09-11 18:36:41', NULL, NULL, NULL, 45, 46, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (53, 1848.05, TIMESTAMP '2016-07-05 18:15:06', NULL, NULL, NULL, 34, 43, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (54, 1002.97, TIMESTAMP '2016-06-20 06:06:46', NULL,
        'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien',
        NULL, 3, 22, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (55, 1223.56, TIMESTAMP '2016-03-31 07:41:57', NULL,
        'id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi', NULL, 39, 45, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (56, 1889.37, TIMESTAMP '2016-06-09 09:39:42', NULL,
        'lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam',
        NULL, 13, 3, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (57, 146.92, TIMESTAMP '2016-07-07 17:14:45', NULL, NULL, NULL, 22, 1, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (58, 1505.79, TIMESTAMP '2016-03-31 08:02:16', NULL, NULL, NULL, 40, 33, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (59, 1513.84, TIMESTAMP '2016-03-27 21:21:01', NULL, NULL, NULL, 30, 1, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (60, 639.84, TIMESTAMP '2016-05-19 12:04:53', NULL, NULL, NULL, 30, 25, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (61, 1254.35, TIMESTAMP '2016-08-26 18:04:59', NULL,
        'et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in',
        NULL, 28, 25, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (62, 1937.86, TIMESTAMP '2016-08-11 07:03:56', NULL, NULL, NULL, 30, 10, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (63, 1367.75, TIMESTAMP '2016-10-11 00:46:44', NULL,
        'justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia',
        NULL, 7, 42, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (64, 945.48, TIMESTAMP '2016-03-31 12:24:43', NULL, NULL, NULL, 37, 35, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (65, 355.27, TIMESTAMP '2016-05-28 18:50:50', NULL,
        'sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non', NULL, 30, 17, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (66, 872.16, TIMESTAMP '2016-02-28 05:07:17', NULL,
        'rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus', NULL, 38, 22, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (67, 1185.19, TIMESTAMP '2016-02-14 09:54:04', NULL,
        'nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse', NULL, 22, 17, 1,
        2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (68, 350.47, TIMESTAMP '2016-07-03 04:47:13', NULL,
        'luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique',
        NULL, 30, 1, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (69, 738.43, TIMESTAMP '2016-05-02 04:17:02', NULL,
        'quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et',
        NULL, 27, 12, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (70, 1206.12, TIMESTAMP '2016-06-13 05:51:30', NULL,
        'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus', NULL, 46, 35, 2,
        4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (71, 1474.71, TIMESTAMP '2016-11-06 00:09:00', NULL, NULL, NULL, 1, 31, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (72, 593.38, TIMESTAMP '2016-03-18 09:29:18', NULL,
        'quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse',
        NULL, 31, 22, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (73, 1430.1, TIMESTAMP '2015-12-11 06:32:50', NULL,
        'duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor', NULL, 38, 17, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (74, 807.37, TIMESTAMP '2016-01-04 01:57:26', NULL, NULL, NULL, 25, 13, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (75, 103.07, TIMESTAMP '2016-03-25 20:47:00', NULL,
        'elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium', NULL, 2, 48, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (76, 321.71, TIMESTAMP '2016-09-14 04:57:50', NULL, NULL, NULL, 30, 19, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (77, 990.97, TIMESTAMP '2016-01-26 22:49:03', NULL, NULL, NULL, 30, 28, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (78, 1784.9, TIMESTAMP '2016-11-05 08:03:12', NULL,
        'vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis', NULL, 2, 18, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (79, 269.55, TIMESTAMP '2016-09-15 02:55:32', NULL,
        'donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper', NULL, 24, 33, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (80, 1041.57, TIMESTAMP '2016-02-24 08:05:28', NULL,
        'mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis', NULL, 7, 15, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (81, 1473.25, TIMESTAMP '2016-03-27 01:19:38', NULL, NULL, NULL, 34, 27, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (82, 494.79, TIMESTAMP '2016-07-31 07:17:55', NULL,
        'pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit', NULL,
        27, 17, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (83, 811.14, TIMESTAMP '2016-07-08 04:51:57', NULL,
        'sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis',
        NULL, 6, 22, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (84, 38.46, TIMESTAMP '2016-03-19 06:50:18', NULL,
        'sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc', NULL, 18, 17, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (85, 163.41, TIMESTAMP '2016-08-24 19:52:56', NULL,
        'adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus',
        NULL, 5, 9, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (86, 1034.85, TIMESTAMP '2016-03-09 08:11:37', NULL,
        'vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci', NULL, 32, 3, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (87, 1639.04, TIMESTAMP '2016-06-21 14:20:49', NULL, NULL, NULL, 18, 39, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (88, 591.09, TIMESTAMP '2016-11-23 18:40:43', NULL,
        'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat', NULL, 47, 8, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (89, 1647.77, TIMESTAMP '2015-12-07 01:56:46', NULL,
        'porttitor pede justo eu massa donec dapibus duis at velit eu est', NULL, 13, 36, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (90, 1382.17, TIMESTAMP '2016-05-14 03:09:03', NULL, NULL, NULL, 28, 44, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (91, 948.62, TIMESTAMP '2016-03-29 09:50:04', NULL,
        'nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio',
        NULL, 47, 26, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (92, 135.12, TIMESTAMP '2016-01-23 00:04:35', NULL,
        'ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat', NULL, 22, 39, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (93, 1097.86, TIMESTAMP '2016-08-24 15:29:32', NULL,
        'cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non', NULL,
        9, 11, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (94, 910.9, TIMESTAMP '2016-07-30 10:49:57', NULL, 'duis bibendum morbi non quam nec dui luctus rutrum nulla', NULL,
   17, 22, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (95, 532.53, TIMESTAMP '2016-02-29 23:49:18', NULL, 'vel est donec odio justo sollicitudin ut suscipit a feugiat',
   NULL, 46, 11, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (96, 436.3, TIMESTAMP '2016-08-06 14:20:44', NULL,
        'varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis', NULL,
        29, 21, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (97, 213.08, TIMESTAMP '2016-05-27 23:21:16', NULL,
        'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum', NULL, 19, 18, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (98, 903.86, TIMESTAMP '2016-08-29 14:33:55', NULL,
        'vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id',
        NULL, 5, 36, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (99, 1884.73, TIMESTAMP '2015-12-16 16:36:24', NULL, NULL, NULL, 13, 23, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (100, 1505.58, TIMESTAMP '2016-02-28 18:55:13', NULL, 'ultrices mattis odio donec vitae nisi nam ultrices libero non',
   NULL, 23, 49, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (101, 786.58, TIMESTAMP '2016-08-28 07:36:51', NULL,
        'id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in', NULL, 6, 29,
        1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (102, 770.52, TIMESTAMP '2016-11-03 01:32:33', NULL, 'a feugiat et eros vestibulum ac est lacinia nisi venenatis',
   NULL, 48, 33, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (103, 362.81, TIMESTAMP '2016-08-06 11:00:44', NULL,
        'velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', NULL, 8, 10, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (104, 746.67, TIMESTAMP '2016-11-25 15:53:31', NULL,
        'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non',
        NULL, 1, 8, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (105, 1496.62, TIMESTAMP '2016-04-12 16:42:09', NULL,
        'pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est',
        NULL, 22, 42, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (106, 661.22, TIMESTAMP '2015-12-17 09:01:49', NULL, NULL, NULL, 7, 48, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (107, 400.84, TIMESTAMP '2016-06-24 08:39:55', NULL, NULL, NULL, 18, 8, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (108, 691.26, TIMESTAMP '2016-10-22 12:15:03', NULL,
        'in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan', NULL, 7, 20, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (109, 79.97, TIMESTAMP '2016-08-02 00:29:28', NULL,
        'tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget',
        NULL, 24, 21, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (110, 449.02, TIMESTAMP '2015-12-15 11:58:36', NULL,
        'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus', NULL, 49, 45, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (111, 1288.68, TIMESTAMP '2016-03-13 17:52:59', NULL, NULL, NULL, 28, 48, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (112, 1605.07, TIMESTAMP '2016-06-20 04:02:56', NULL, NULL, NULL, 23, 46, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (113, 1026.92, TIMESTAMP '2016-03-11 01:14:10', NULL, NULL, NULL, 33, 13, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (114, 1155.37, TIMESTAMP '2016-04-30 04:16:50', NULL, NULL, NULL, 20, 39, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (115, 1862.58, TIMESTAMP '2016-07-10 02:29:20', NULL,
        'lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy',
        NULL, 12, 14, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (116, 615.43, TIMESTAMP '2016-05-27 15:37:23', NULL,
        'nulla sed accumsan felis ut at dolor quis odio consequat varius', NULL, 10, 33, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (117, 1137.55, TIMESTAMP '2016-10-23 04:15:51', NULL,
        'accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum', NULL, 32, 28,
        2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (118, 91.31, TIMESTAMP '2016-11-29 08:37:41', NULL,
        'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris',
        NULL, 18, 20, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (119, 1830.91, TIMESTAMP '2016-04-14 22:57:38', NULL,
        'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam', NULL, 41, 1, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (120, 1278.04, TIMESTAMP '2016-09-08 22:34:52', NULL, 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc',
   NULL, 14, 36, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (121, 93.53, TIMESTAMP '2016-06-22 02:01:17', NULL,
        'sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget',
        NULL, 24, 44, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (122, 1028.27, TIMESTAMP '2016-08-17 14:05:45', NULL, NULL, NULL, 44, 8, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (123, 478.05, TIMESTAMP '2016-02-07 11:21:01', NULL, NULL, NULL, 49, 19, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (124, 1298.69, TIMESTAMP '2015-12-21 00:08:03', NULL,
        'aliquam convallis nunc proin at turpis a pede posuere nonummy integer non', NULL, 27, 16, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (125, 1321.58, TIMESTAMP '2016-10-26 02:50:32', NULL, NULL, NULL, 3, 23, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (126, 2.6, TIMESTAMP '2016-02-16 21:36:19', NULL,
        'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor',
        NULL, 32, 11, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (127, 322.75, TIMESTAMP '2016-07-07 23:13:53', NULL, NULL, NULL, 36, 29, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (128, 1669.13, TIMESTAMP '2016-02-05 09:29:35', NULL, NULL, NULL, 43, 31, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (129, 319.28, TIMESTAMP '2016-06-20 10:34:27', NULL, NULL, NULL, 46, 7, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (130, 1661.36, TIMESTAMP '2016-08-04 17:15:59', NULL, NULL, NULL, 7, 28, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (131, 499.75, TIMESTAMP '2016-01-16 20:58:56', NULL, NULL, NULL, 20, 7, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (132, 607.58, TIMESTAMP '2016-09-23 03:50:16', NULL, NULL, NULL, 48, 29, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (133, 1792.03, TIMESTAMP '2016-06-06 00:22:15', NULL,
        'amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus',
        NULL, 28, 5, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (134, 558.26, TIMESTAMP '2016-09-10 09:06:52', NULL,
        'sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue', NULL, 43, 18, 2,
        1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (135, 1512.36, TIMESTAMP '2016-03-07 10:04:44', NULL, NULL, NULL, 38, 39, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (136, 452.48, TIMESTAMP '2016-03-17 21:49:35', NULL,
        'parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum', NULL, 46, 22, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (137, 1188.37, TIMESTAMP '2016-11-20 13:06:56', NULL, NULL, NULL, 24, 17, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (138, 1490.78, TIMESTAMP '2016-09-21 10:44:52', NULL,
        'pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae',
        NULL, 21, 28, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (139, 430.37, TIMESTAMP '2016-07-28 07:20:25', NULL, NULL, NULL, 34, 35, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (140, 247.28, TIMESTAMP '2015-12-10 14:32:01', NULL,
        'eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique',
        NULL, 10, 34, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (141, 995.94, TIMESTAMP '2016-10-21 17:09:54', NULL, NULL, NULL, 49, 30, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (142, 878.09, TIMESTAMP '2016-11-19 23:51:52', NULL, NULL, NULL, 37, 11, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (143, 672.66, TIMESTAMP '2016-09-05 07:55:15', NULL, NULL, NULL, 14, 37, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (144, 1773.12, TIMESTAMP '2016-05-05 03:57:46', NULL,
        'metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam', NULL, 18, 12, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (145, 14.45, TIMESTAMP '2016-04-22 02:54:48', NULL,
        'at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam',
        NULL, 26, 16, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (146, 1654.55, TIMESTAMP '2015-12-28 09:06:41', NULL,
        'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim', NULL, 1, 9, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (147, 1933.51, TIMESTAMP '2016-09-09 21:11:50', NULL,
        'proin at turpis a pede posuere nonummy integer non velit donec', NULL, 20, 17, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (148, 930.2, TIMESTAMP '2015-12-06 02:41:00', NULL, NULL, NULL, 33, 17, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (149, 609.76, TIMESTAMP '2016-09-23 15:07:10', NULL,
        'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis', NULL, 7, 29, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (150, 650.07, TIMESTAMP '2016-09-03 10:59:04', NULL,
        'platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras',
        NULL, 28, 14, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (151, 634.36, TIMESTAMP '2016-05-21 17:58:03', NULL, NULL, NULL, 21, 46, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (152, 1039.89, TIMESTAMP '2016-05-30 14:55:43', NULL, NULL, NULL, 47, 36, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (153, 1209.32, TIMESTAMP '2016-05-02 11:58:40', NULL,
        'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia', NULL, 15, 8, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (154, 1255.47, TIMESTAMP '2016-09-27 00:18:34', NULL, NULL, NULL, 7, 34, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (155, 1780.46, TIMESTAMP '2016-05-28 10:06:01', NULL,
        'semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis', NULL, 37, 48,
        2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (156, 1905.88, TIMESTAMP '2016-03-05 08:31:13', NULL,
        'sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis',
        NULL, 23, 25, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (157, 762.61, TIMESTAMP '2016-01-15 12:12:39', NULL,
        'vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor',
        NULL, 36, 28, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (158, 640.85, TIMESTAMP '2016-09-07 20:30:45', NULL, NULL, NULL, 3, 22, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (159, 557.9, TIMESTAMP '2016-06-07 17:18:25', NULL, NULL, NULL, 27, 37, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (160, 1437.48, TIMESTAMP '2015-12-10 19:04:21', NULL,
        'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi', NULL, 35, 35, 3,
        3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (161, 1411.52, TIMESTAMP '2016-08-12 17:32:40', NULL,
        'elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in',
        NULL, 1, 25, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (162, 1773.48, TIMESTAMP '2016-03-08 00:53:32', NULL, NULL, NULL, 14, 7, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (163, 27.87, TIMESTAMP '2016-09-14 12:39:10', NULL,
        'proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit',
        NULL, 29, 15, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (164, 544.51, TIMESTAMP '2016-11-08 16:34:51', NULL,
        'amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo', NULL, 23, 49, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (165, 1336.01, TIMESTAMP '2016-10-03 05:39:35', NULL,
        'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo',
        NULL, 26, 28, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (166, 1036.0, TIMESTAMP '2016-01-15 04:47:48', NULL,
        'nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti', NULL, 8, 36, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (167, 1411.24, TIMESTAMP '2016-03-18 22:38:28', NULL,
        'maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra',
        NULL, 40, 22, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (168, 33.94, TIMESTAMP '2016-08-11 02:29:28', NULL, NULL, NULL, 33, 4, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (169, 87.0, TIMESTAMP '2016-09-23 22:08:31', NULL,
        'interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus', NULL, 35, 15, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (170, 1826.45, TIMESTAMP '2016-07-06 04:41:26', NULL,
        'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla',
        NULL, 38, 22, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (171, 1237.73, TIMESTAMP '2016-09-01 16:02:05', NULL,
        'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem',
        NULL, 43, 26, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (172, 1462.86, TIMESTAMP '2016-06-02 19:29:03', NULL,
        'arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam',
        NULL, 43, 40, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (173, 14.3, TIMESTAMP '2016-02-05 13:33:26', NULL,
        'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam',
        NULL, 11, 24, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (174, 499.21, TIMESTAMP '2016-02-19 04:25:14', NULL,
        'aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a', NULL, 4, 22, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (175, 1073.85, TIMESTAMP '2016-02-10 12:17:10', NULL, NULL, NULL, 22, 42, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (176, 696.36, TIMESTAMP '2016-11-26 15:22:41', NULL,
        'interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam',
        NULL, 16, 47, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (177, 1717.87, TIMESTAMP '2016-08-14 14:55:55', NULL,
        'proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus',
        NULL, 49, 45, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (178, 196.98, TIMESTAMP '2016-10-14 17:12:16', NULL, NULL, NULL, 4, 10, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (179, 900.88, TIMESTAMP '2016-06-24 00:26:34', NULL, NULL, NULL, 19, 20, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (180, 554.11, TIMESTAMP '2016-06-21 07:14:31', NULL,
        'lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae',
        NULL, 43, 50, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (181, 1857.15, TIMESTAMP '2016-04-14 05:15:33', NULL,
        'in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean',
        NULL, 29, 30, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (182, 538.13, TIMESTAMP '2016-09-29 05:18:09', NULL,
        'nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu', NULL,
        35, 18, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (183, 1180.97, TIMESTAMP '2015-12-17 06:50:18', NULL,
        'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat',
        NULL, 49, 29, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (184, 333.13, TIMESTAMP '2016-06-01 18:33:36', NULL,
        'sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam', NULL, 48, 38, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (185, 353.79, TIMESTAMP '2016-09-21 20:03:42', NULL,
        'consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis', NULL, 31, 29, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (186, 1302.82, TIMESTAMP '2016-09-14 04:37:01', NULL,
        'id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque',
        NULL, 5, 16, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (187, 82.52, TIMESTAMP '2016-11-07 17:26:11', NULL,
        'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam', NULL, 32, 1, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (188, 520.4, TIMESTAMP '2016-04-28 09:04:02', NULL, 'ut volutpat sapien arcu sed augue aliquam erat volutpat in',
        NULL, 37, 32, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (189, 662.48, TIMESTAMP '2016-03-24 06:26:51', NULL,
        'placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem',
        NULL, 33, 30, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (190, 1148.84, TIMESTAMP '2016-09-30 04:00:07', NULL, NULL, NULL, 22, 27, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (191, 1008.09, TIMESTAMP '2016-05-01 08:40:15', NULL, 'purus sit amet nulla quisque arcu libero rutrum ac lobortis',
   NULL, 21, 6, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (192, 1522.31, TIMESTAMP '2016-08-17 19:46:30', NULL, NULL, NULL, 20, 12, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (193, 505.26, TIMESTAMP '2016-10-22 13:18:54', NULL,
        'pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper',
        NULL, 11, 11, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (194, 1017.69, TIMESTAMP '2016-07-16 02:13:47', NULL,
        'dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus', NULL, 14, 33, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (195, 375.82, TIMESTAMP '2016-09-11 09:43:37', NULL,
        'sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', NULL, 6, 29,
        1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (196, 788.15, TIMESTAMP '2016-04-07 07:09:17', NULL,
        'in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut',
        NULL, 29, 36, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (197, 1941.78, TIMESTAMP '2016-06-25 20:26:35', NULL,
        'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum',
        NULL, 35, 42, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (198, 1808.95, TIMESTAMP '2016-07-23 11:52:18', NULL,
        'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia',
        NULL, 6, 38, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (199, 1892.81, TIMESTAMP '2016-04-18 09:30:08', NULL, NULL, NULL, 47, 45, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (200, 1687.44, TIMESTAMP '2016-07-08 22:53:21', NULL,
        'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean', NULL, 5, 46, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (201, 1046.6, TIMESTAMP '2016-07-09 12:54:58', NULL,
        'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit',
        NULL, 29, 32, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (202, 1489.9, TIMESTAMP '2016-09-16 10:51:10', NULL, 'quisque erat eros viverra eget congue eget semper rutrum nulla',
   NULL, 31, 50, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (203, 1975.18, TIMESTAMP '2016-07-09 19:18:43', NULL,
        'quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis', NULL,
        34, 27, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (204, 1871.89, TIMESTAMP '2016-06-20 19:41:08', NULL,
        'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat',
        NULL, 33, 27, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (205, 1121.32, TIMESTAMP '2016-07-19 01:16:00', NULL,
        'et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo', NULL, 41, 5, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (206, 66.32, TIMESTAMP '2016-10-09 12:51:04', NULL,
        'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non',
        NULL, 48, 38, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (207, 1100.61, TIMESTAMP '2016-08-31 03:14:42', NULL, NULL, NULL, 45, 36, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (208, 139.65, TIMESTAMP '2016-09-21 20:20:09', NULL,
        'morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor', NULL, 11, 34, 1,
        3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (209, 395.32, TIMESTAMP '2016-02-01 00:00:46', NULL,
        'nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', NULL, 39, 21, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (210, 459.63, TIMESTAMP '2016-02-05 19:38:45', NULL,
        'nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum',
        NULL, 3, 34, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (211, 453.13, TIMESTAMP '2016-07-28 03:17:34', NULL,
        'donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium',
        NULL, 32, 29, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (212, 861.48, TIMESTAMP '2016-10-13 14:41:31', NULL, NULL, NULL, 39, 24, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (213, 1450.21, TIMESTAMP '2016-11-15 20:31:10', NULL,
        'nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget', NULL, 35, 43, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (214, 913.5, TIMESTAMP '2016-01-30 02:47:03', NULL, NULL, NULL, 7, 31, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (215, 947.7, TIMESTAMP '2016-03-03 17:49:14', NULL,
        'vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante',
        NULL, 50, 11, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (216, 869.02, TIMESTAMP '2016-06-19 07:07:46', NULL, NULL, NULL, 26, 24, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (217, 1279.76, TIMESTAMP '2016-01-18 08:02:00', NULL,
        'magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem',
        NULL, 10, 11, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (218, 1890.52, TIMESTAMP '2016-01-22 07:41:26', NULL,
        'varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia',
        NULL, 13, 45, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (219, 452.14, TIMESTAMP '2016-04-18 21:28:55', NULL,
        'volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus',
        NULL, 22, 15, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (220, 1177.47, TIMESTAMP '2016-10-16 14:08:33', NULL,
        'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis', NULL, 7, 42, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (221, 654.27, TIMESTAMP '2015-12-10 08:57:51', NULL,
        'congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo',
        NULL, 28, 34, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (222, 1156.91, TIMESTAMP '2016-11-18 20:55:58', NULL, NULL, NULL, 45, 41, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (223, 809.47, TIMESTAMP '2016-10-12 00:14:34', NULL, NULL, NULL, 43, 45, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (224, 607.49, TIMESTAMP '2015-12-29 21:27:47', NULL,
        'at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum', NULL, 6, 4, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (225, 709.63, TIMESTAMP '2016-03-30 06:47:45', NULL,
        'cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra', NULL, 27, 38, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (226, 1085.26, TIMESTAMP '2016-02-16 01:19:04', NULL, NULL, NULL, 22, 19, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (227, 665.38, TIMESTAMP '2016-03-10 14:33:06', NULL,
        'sit amet eleifend pede libero quis orci nullam molestie nibh in', NULL, 5, 22, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (228, 1047.16, TIMESTAMP '2015-12-26 12:44:04', NULL, NULL, NULL, 49, 2, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (229, 165.8, TIMESTAMP '2016-04-11 18:56:20', NULL, NULL, NULL, 45, 20, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (230, 930.55, TIMESTAMP '2016-08-31 06:53:45', NULL,
        'in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at', NULL, 10,
        17, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (231, 1919.29, TIMESTAMP '2016-11-14 18:18:42', NULL,
        'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum',
        NULL, 41, 45, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (232, 1912.28, TIMESTAMP '2016-10-28 08:15:51', NULL,
        'ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero', NULL, 50, 21, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (233, 1908.86, TIMESTAMP '2016-11-22 02:54:35', NULL,
        'integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', NULL, 1,
        20, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (234, 211.41, TIMESTAMP '2016-01-29 03:15:15', NULL, NULL, NULL, 37, 49, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (235, 1239.93, TIMESTAMP '2016-03-09 09:11:42', NULL,
        'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum',
        NULL, 36, 24, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (236, 1312.81, TIMESTAMP '2016-02-14 06:01:37', NULL,
        'at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget', NULL, 41,
        32, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (237, 1428.49, TIMESTAMP '2016-08-01 13:45:12', NULL,
        'eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus', NULL,
        49, 37, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (238, 440.21, TIMESTAMP '2016-06-10 07:55:42', NULL, NULL, NULL, 3, 46, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (239, 941.19, TIMESTAMP '2016-07-23 03:09:00', NULL, NULL, NULL, 37, 28, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (240, 926.17, TIMESTAMP '2016-03-19 16:24:44', NULL,
        'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti', NULL, 32, 6, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (241, 1253.9, TIMESTAMP '2016-08-29 21:38:01', NULL,
        'tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', NULL, 50, 42, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (242, 1013.92, TIMESTAMP '2016-09-29 05:27:08', NULL,
        'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh', NULL, 18, 41, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (243, 334.45, TIMESTAMP '2015-12-09 12:04:07', NULL, NULL, NULL, 26, 41, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (244, 80.15, TIMESTAMP '2016-01-12 16:01:07', NULL,
        'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus', NULL, 33,
        31, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (245, 489.18, TIMESTAMP '2016-06-27 09:15:01', NULL,
        'nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis',
        NULL, 39, 20, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (246, 301.62, TIMESTAMP '2016-10-23 22:19:21', NULL,
        'felis sed interdum venenatis turpis enim blandit mi in porttitor pede', NULL, 30, 29, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (247, 1464.01, TIMESTAMP '2016-07-08 06:38:45', NULL,
        'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl', NULL, 30, 5, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (248, 1932.59, TIMESTAMP '2016-03-11 23:54:01', NULL, NULL, NULL, 33, 16, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (249, 477.33, TIMESTAMP '2016-07-10 17:30:50', NULL, NULL, NULL, 50, 45, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (250, 1684.55, TIMESTAMP '2016-01-02 13:35:22', NULL,
        'cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes', NULL,
        37, 30, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (251, 1884.63, TIMESTAMP '2016-01-02 16:41:03', NULL,
        'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in',
        NULL, 20, 32, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (252, 1135.74, TIMESTAMP '2016-06-17 18:30:11', NULL,
        'eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit', NULL, 12, 43, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (253, 1205.93, TIMESTAMP '2015-12-06 11:33:56', NULL,
        'at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget', NULL, 6, 5, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (254, 1029.16, TIMESTAMP '2016-10-30 08:37:27', NULL,
        'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna', NULL,
        23, 41, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (255, 379.53, TIMESTAMP '2016-08-06 15:03:48', NULL,
        'ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst', NULL, 8, 36, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (256, 428.5, TIMESTAMP '2016-06-13 15:54:49', NULL,
        'mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', NULL, 15, 13, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (257, 1159.43, TIMESTAMP '2016-06-07 15:40:37', NULL, NULL, NULL, 47, 6, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (258, 1138.29, TIMESTAMP '2016-08-04 17:16:15', NULL,
        'dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero',
        NULL, 12, 33, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (259, 913.16, TIMESTAMP '2016-07-21 12:46:41', NULL,
        'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy', NULL, 33, 2, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (260, 277.21, TIMESTAMP '2015-12-02 17:27:23', NULL,
        'nisi at nibh in hac habitasse platea dictumst aliquam augue quam', NULL, 12, 11, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (261, 1010.71, TIMESTAMP '2016-09-04 10:19:17', NULL, 'morbi vel lectus in quam fringilla rhoncus mauris enim leo',
   NULL, 46, 12, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (262, 1444.78, TIMESTAMP '2016-02-05 12:23:00', NULL,
        'semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac', NULL, 49, 19, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (263, 1930.56, TIMESTAMP '2016-10-28 15:07:02', NULL,
        'aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum', NULL, 10, 23, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (264, 404.54, TIMESTAMP '2016-07-09 22:22:20', NULL, NULL, NULL, 37, 7, 2, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (265, 1504.36, TIMESTAMP '2016-02-08 12:13:15', NULL,
        'turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi', NULL,
        49, 22, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (266, 1953.52, TIMESTAMP '2016-03-12 06:33:12', NULL, NULL, NULL, 19, 31, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (267, 14.33, TIMESTAMP '2016-05-31 13:34:59', NULL,
        'volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec',
        NULL, 36, 36, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (268, 299.96, TIMESTAMP '2016-10-08 13:02:19', NULL, NULL, NULL, 44, 35, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (269, 1474.52, TIMESTAMP '2016-10-16 17:50:12', NULL,
        'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu',
        NULL, 15, 1, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (270, 1189.4, TIMESTAMP '2016-02-25 23:38:31', NULL,
        'magnis dis parturient montes nascetur ridiculus mus etiam vel augue', NULL, 29, 27, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (271, 1138.49, TIMESTAMP '2016-03-21 06:47:14', NULL, NULL, NULL, 48, 3, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (272, 1795.29, TIMESTAMP '2016-02-03 09:36:32', NULL,
        'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum',
        NULL, 13, 30, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (273, 282.87, TIMESTAMP '2016-10-06 06:34:53', NULL,
        'felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu',
        NULL, 5, 39, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (274, 903.73, TIMESTAMP '2015-12-21 09:13:23', NULL,
        'praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci',
        NULL, 36, 28, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES
  (275, 1565.14, TIMESTAMP '2016-05-31 01:08:29', NULL, 'donec dapibus duis at velit eu est congue elementum in hac',
   NULL, 25, 28, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (276, 1583.96, TIMESTAMP '2016-05-12 01:36:29', NULL, NULL, NULL, 17, 24, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (277, 506.45, TIMESTAMP '2016-02-17 00:09:16', NULL,
        'erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper',
        NULL, 33, 17, 1, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (278, 1048.97, TIMESTAMP '2016-11-03 22:48:27', NULL,
        'magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis',
        NULL, 15, 26, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (279, 1967.09, TIMESTAMP '2016-03-28 02:24:47', NULL,
        'orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt',
        NULL, 36, 37, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (280, 1022.64, TIMESTAMP '2016-09-07 05:52:34', NULL,
        'eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare', NULL, 11, 11, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (281, 59.03, TIMESTAMP '2016-11-15 05:45:18', NULL,
        'curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien',
        NULL, 4, 20, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (282, 1964.35, TIMESTAMP '2016-03-07 22:27:44', NULL,
        'platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut', NULL, 6,
        18, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (283, 1338.62, TIMESTAMP '2016-02-03 02:20:58', NULL,
        'purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor', NULL,
        15, 19, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (284, 164.29, TIMESTAMP '2016-08-01 15:55:44', NULL,
        'potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient', NULL,
        7, 2, 2, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (285, 533.84, TIMESTAMP '2016-03-01 02:51:01', NULL,
        'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis',
        NULL, 15, 37, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (286, 1364.44, TIMESTAMP '2016-02-12 21:40:44', NULL,
        'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus',
        NULL, 49, 46, 2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (287, 1674.02, TIMESTAMP '2016-11-12 16:54:11', NULL,
        'non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci', NULL, 30, 26, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (288, 173.41, TIMESTAMP '2015-12-18 20:10:48', NULL,
        'in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin',
        NULL, 6, 5, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (289, 147.64, TIMESTAMP '2016-08-30 05:30:10', NULL,
        'scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum',
        NULL, 49, 49, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (290, 1855.19, TIMESTAMP '2016-09-24 07:44:25', NULL,
        'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', NULL,
        24, 44, 1, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (291, 1339.74, TIMESTAMP '2016-04-23 09:30:58', NULL,
        'placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget', NULL, 13, 50, 3, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (292, 1181.47, TIMESTAMP '2016-11-23 17:37:29', NULL,
        'velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium', NULL, 50,
        40, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (293, 1836.79, TIMESTAMP '2016-07-04 09:58:40', NULL,
        'justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor',
        NULL, 17, 41, 3, 2);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (294, 396.49, TIMESTAMP '2016-06-08 11:34:06', NULL, NULL, NULL, 27, 39, 2, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (295, 245.41, TIMESTAMP '2016-09-01 13:15:18', NULL,
        'ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum', NULL, 11, 39,
        2, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (296, 538.57, TIMESTAMP '2016-04-06 01:02:08', NULL,
        'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est',
        NULL, 38, 4, 3, 3);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (297, 123.57, TIMESTAMP '2016-07-11 08:41:56', NULL,
        'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum', NULL, 7,
        29, 1, 4);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (298, 160.96, TIMESTAMP '2016-10-01 01:01:13', NULL,
        'cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing',
        NULL, 43, 22, 3, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (299, 1462.91, TIMESTAMP '2016-08-16 06:39:05', NULL, NULL, NULL, 31, 5, 1, 1);
INSERT INTO ers_reimbursement (reimb_id, reimb_amount, reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id)
VALUES (300, 946.18, TIMESTAMP '2016-09-29 19:38:15', NULL, NULL, NULL, 12, 41, 1, 1);

COMMIT;