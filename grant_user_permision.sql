/* Adding Users */

-- Creating Roles
CREATE ROLE 'alu_admin', 'alu_admin', 'alu_admin';

-- Assign Privileges to Roles
GRANT ALL ON alu_db.* TO 'alu_admin';
GRANT SELECT ON alu_db.* TO 'alu_admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON alu_db.* TO 'alu_admin';
