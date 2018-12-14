CREATE TABLE user (
	id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL

);

CREATE TABLE scanner_instance (
	pid VARCHAR(50) PRIMARY KEY,
	security_key VARCHAR(50) NOT NULL
);

CREATE TABLE user_scanner_instance (
	user_id BIGINT UNSIGNED NOT NULL,
	scanner_instance_pid VARCHAR(50) NOT NULL,
	FOREIGN KEY user_fk(user_id) REFERENCES user(id),
	FOREIGN KEY usersi_scanner_instance_fk(scanner_instance_pid) REFERENCES scanner_instance(pid)
);

CREATE TABLE hardware_type (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE hardware (
	id SERIAL PRIMARY KEY,
	hardware_type_id BIGINT UNSIGNED NULL,
	name VARCHAR(50) NOT NULL,
	FOREIGN KEY hardware_type(hardware_type_id) REFERENCES hardware_type(id)
);

CREATE TABLE software (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE report (
	id SERIAL PRIMARY KEY,
	scanner_instance_pid VARCHAR(50) NOT NULL,
	created DATETIME NOT NULL,
	FOREIGN KEY report_scanner_instance_fk(scanner_instance_pid) REFERENCES scanner_instance(pid)
);

CREATE TABLE hardware_report (
	id SERIAL PRIMARY KEY,
	hardware_id BIGINT UNSIGNED NOT NULL,
	report_id BIGINT UNSIGNED NOT NULL,
	report_info VARCHAR(255) NOT NULL,
	FOREIGN KEY hardware_fk(hardware_id) REFERENCES hardware(id),
	FOREIGN KEY hardware_report_report_fk(report_id) REFERENCES report(id)
);

CREATE TABLE software_report (
	id SERIAL PRIMARY KEY,
	software_id BIGINT UNSIGNED NOT NULL,
	report_id BIGINT UNSIGNED NOT NULL,
	report_info VARCHAR(255) NOT NULL,
	FOREIGN KEY software_fk(software_id) REFERENCES software(id),
	FOREIGN KEY software_report_report_fk(report_id) REFERENCES report(id)
);
