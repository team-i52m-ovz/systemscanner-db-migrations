CREATE TABLE "user" (
	id BIGSERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL

);

CREATE TABLE scanner_instance (
	pid VARCHAR(50) PRIMARY KEY,
	security_key VARCHAR(50) NOT NULL
);

CREATE TABLE user_scanner_instance (
	user_id BIGSERIAL NOT NULL REFERENCES "user"(id),
	scanner_instance_pid VARCHAR(50) NOT NULL REFERENCES scanner_instance(pid)
);

CREATE TABLE hardware_type (
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE hardware (
	id BIGSERIAL PRIMARY KEY,
	hardware_type_id BIGINT NULL REFERENCES hardware_type(id),
	name VARCHAR(50) NOT NULL
);

CREATE TABLE software (
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE report (
	id BIGSERIAL PRIMARY KEY,
	scanner_instance_pid VARCHAR(50) NOT NULL REFERENCES scanner_instance(pid),
	created TIMESTAMP NOT NULL
);

CREATE TABLE hardware_report (
	id BIGSERIAL PRIMARY KEY,
	hardware_id BIGINT NOT NULL REFERENCES hardware(id),
	report_id BIGINT NOT NULL REFERENCES report(id),
	report_info VARCHAR(255) NOT NULL
);

CREATE TABLE software_report (
	id BIGSERIAL PRIMARY KEY,
	software_id BIGINT NOT NULL REFERENCES software(id),
	report_id BIGINT NOT NULL REFERENCES report(id),
	report_info VARCHAR(255) NOT NULL
);
