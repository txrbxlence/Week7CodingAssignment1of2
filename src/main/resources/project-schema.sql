DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project(
	project_id INT NOT NULL AUTO_INCREMENT, /*PK*/
	project_name varchar(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);

CREATE TABLE material(
	material_id INT AUTO_INCREMENT NOT NULL, /*PK*/
	project_id INT NOT NULL, /*FK*/
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE step(
	step_id INT AUTO_INCREMENT NOT NULL,  /*PK*/
	project_id INT NOT NULL, /*FK*/
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE category(
	category_id INT AUTO_INCREMENT NOT NULL, /*PK*/
	category_name VARCHAR(128),
	PRIMARY KEY (category_id)
);

CREATE TABLE project_category(
	project_id INT NOT NULL, /*FK, UK with category_id*/
	category_id INT NOT NULL, /*FK, UK with project_id*/
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
	UNIQUE KEY (project_id, category_id)
);