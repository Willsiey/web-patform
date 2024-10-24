/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 15.2 		*/
/*  Created On : 03-окт-2024 12:53:48 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS "Battle_participants" CASCADE
;

DROP TABLE IF EXISTS "Battles" CASCADE
;

DROP TABLE IF EXISTS "Tasks" CASCADE
;

DROP TABLE IF EXISTS "User_Task" CASCADE
;

DROP TABLE IF EXISTS "Users" CASCADE
;

/* Create Tables */

CREATE TABLE "Battle_participants"
(
	btid uuid NOT NULL,
	uid uuid NOT NULL,
	result varchar(50) NOT NULL,
	start_at timestamp without time zone NULL,
	end_at timestamp without time zone NULL
)
;

CREATE TABLE "Battles"
(
	id uuid NOT NULL,
	category_id uuid NOT NULL,
	subcategory_id uuid NOT NULL,
	title varchar(50) NOT NULL,
	description text NULL,
	reward_points integer NOT NULL
)
;

CREATE TABLE "Tasks"
(
	id uuid NOT NULL,
	btid uuid NOT NULL,
	description text NOT NULL,
	reward integer NOT NULL
)
;

CREATE TABLE "User_Task"
(
	tid uuid NOT NULL,
	uid uuid NOT NULL,
	sybmisiion text NOT NULL,
	submission_time timestamp without time zone NOT NULL,
	reward integer NOT NULL
)
;

CREATE TABLE "Users"
(
	id uuid NOT NULL,
	uid uuid NOT NULL,
	nickname varchar(50) NOT NULL,
	role varchar(50) NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "Battle_participants" ADD CONSTRAINT "PK_Battle_participants"
	PRIMARY KEY (btid)
;

CREATE INDEX "IXFK_Battle_participants_Battles" ON "Battle_participants" (btid ASC)
;

CREATE INDEX "IXFK_Battle_participants_Users" ON "Battle_participants" (uid ASC)
;

ALTER TABLE "Battles" ADD CONSTRAINT "PK_Battles"
	PRIMARY KEY (id)
;

ALTER TABLE "Tasks" ADD CONSTRAINT "PK_Tasks"
	PRIMARY KEY (id)
;

CREATE INDEX "IXFK_Tasks_Battles" ON "Tasks" (btid ASC)
;

ALTER TABLE "User_Task" ADD CONSTRAINT "PK_User_Task"
	PRIMARY KEY (tid)
;

CREATE INDEX "IXFK_User_Task_Tasks" ON "User_Task" (tid ASC)
;

CREATE INDEX "IXFK_User_Task_Users" ON "User_Task" (uid ASC)
;

ALTER TABLE "Users" ADD CONSTRAINT "PK_Users"
	PRIMARY KEY (id)
;

/* Create Foreign Key Constraints */

ALTER TABLE "Battle_participants" ADD CONSTRAINT "FK_Battle_participants_Battles"
	FOREIGN KEY (btid) REFERENCES "Battles" (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Battle_participants" ADD CONSTRAINT "FK_Battle_participants_Users"
	FOREIGN KEY (uid) REFERENCES "Users" (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Tasks" ADD CONSTRAINT "FK_Tasks_Battles"
	FOREIGN KEY (btid) REFERENCES "Battles" (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "User_Task" ADD CONSTRAINT "FK_User_Task_Tasks"
	FOREIGN KEY (tid) REFERENCES "Tasks" (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "User_Task" ADD CONSTRAINT "FK_User_Task_Users"
	FOREIGN KEY (uid) REFERENCES "Users" (id) ON DELETE No Action ON UPDATE No Action
;
