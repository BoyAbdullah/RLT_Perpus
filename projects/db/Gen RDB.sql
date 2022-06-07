/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     6/7/2022 3:39:45 PM                          */
/*==============================================================*/


drop function if exists f_key_gen;

drop procedure if exists p_apps_ins;

drop procedure if exists p_apps_list;

drop procedure if exists p_apps_upd;

drop procedure if exists p_authorize_ins;

drop procedure if exists p_authorize_list;

drop procedure if exists p_authorize_upd;

drop procedure if exists p_authorole_ins;

drop procedure if exists p_authorole_list;

drop procedure if exists p_authorole_upd;

drop procedure if exists p_book_ins;

drop procedure if exists p_book_list;

drop procedure if exists p_book_location_ins;

drop procedure if exists p_book_location_list;

drop procedure if exists p_book_location_upd;

drop procedure if exists p_book_upd;

drop procedure if exists p_bookshelf_ins;

drop procedure if exists p_bookshelf_list;

drop procedure if exists p_bookshelf_upd;

drop procedure if exists p_category_ins;

drop procedure if exists p_category_list;

drop procedure if exists p_category_upd;

drop procedure if exists p_lend_det_ins;

drop procedure if exists p_lend_det_list;

drop procedure if exists p_lend_det_upd;

drop procedure if exists p_lending_ins;

drop procedure if exists p_lending_list;

drop procedure if exists p_lending_upd;

drop procedure if exists p_members_ins;

drop procedure if exists p_members_list;

drop procedure if exists p_members_upd;

drop procedure if exists p_menus_ins;

drop procedure if exists p_menus_list;

drop procedure if exists p_menus_upd;

drop procedure if exists p_persons_ins;

drop procedure if exists p_persons_list;

drop procedure if exists p_persons_upd;

drop procedure if exists p_publisher_ins;

drop procedure if exists p_publisher_list;

drop procedure if exists p_publisher_upd;

drop procedure if exists p_purch_det_ins;

drop procedure if exists p_purch_det_list;

drop procedure if exists p_purch_det_upd;

drop procedure if exists p_purchasing_ins;

drop procedure if exists p_purchasing_list;

drop procedure if exists p_purchasing_upd;

drop procedure if exists p_retur_det_ins;

drop procedure if exists p_retur_det_list;

drop procedure if exists p_retur_det_upd;

drop procedure if exists p_returning_ins;

drop procedure if exists p_returning_list;

drop procedure if exists p_returning_upd;

drop procedure if exists p_users_ins;

drop procedure if exists p_users_list;

drop procedure if exists p_users_upd;

alter table book 
   drop foreign key fk_book_categ;

alter table book 
   drop foreign key fk_book_publish;

alter table book_location 
   drop foreign key fk_locat_book;

alter table book_location 
   drop foreign key fk_locat_bookshelf;

alter table ir_menus 
   drop foreign key fk_apps_menus;

alter table members 
   drop foreign key fk_persons_members;

alter table res_authorole 
   drop foreign key fk_author_authrole;

alter table res_authorole 
   drop foreign key fk_menus_author;

alter table res_users 
   drop foreign key fk_author_users;

alter table res_users 
   drop foreign key fk_person_users;

alter table t_lend_det 
   drop foreign key fk_book_lend_det;

alter table t_lend_det 
   drop foreign key fk_lend_lend_det;

alter table t_lending 
   drop foreign key fk_member_lend;

alter table t_purch_det 
   drop foreign key fk_book_purch_det;

alter table t_purch_det 
   drop foreign key fk_purch_purch_det;

alter table t_purchasing 
   drop foreign key fk_publish_purch;

alter table t_retur_det 
   drop foreign key fk_book_retur_det;

alter table t_retur_det 
   drop foreign key fk_retur_retur_det;

alter table t_returning 
   drop foreign key fk_member_retur;

drop index idx_book on book;


alter table book 
   drop foreign key fk_book_categ;

alter table book 
   drop foreign key fk_book_publish;

drop table if exists book;


alter table book_location 
   drop foreign key fk_locat_book;

alter table book_location 
   drop foreign key fk_locat_bookshelf;

drop table if exists book_location;

drop index idx_bookshelf on bookshelf;

drop table if exists bookshelf;

drop index idx_cat on category;

drop table if exists category;

drop index idx_apps on ir_apps;

drop table if exists ir_apps;

drop index idx_menus on ir_menus;


alter table ir_menus 
   drop foreign key fk_apps_menus;

drop table if exists ir_menus;

drop index idx_members on members;


alter table members 
   drop foreign key fk_persons_members;

drop table if exists members;

drop index idx_publish on publisher;

drop table if exists publisher;

drop index idx_auth on res_authorize;

drop table if exists res_authorize;


alter table res_authorole 
   drop foreign key fk_author_authrole;

alter table res_authorole 
   drop foreign key fk_menus_author;

drop table if exists res_authorole;

drop index idx_persons on res_persons;

drop table if exists res_persons;

drop index idx_users on res_users;


alter table res_users 
   drop foreign key fk_person_users;

alter table res_users 
   drop foreign key fk_author_users;

drop table if exists res_users;

drop index idx_lend_det on t_lend_det;


alter table t_lend_det 
   drop foreign key fk_lend_lend_det;

alter table t_lend_det 
   drop foreign key fk_book_lend_det;

drop table if exists t_lend_det;

drop index idx_lend on t_lending;


alter table t_lending 
   drop foreign key fk_member_lend;

drop table if exists t_lending;

drop index idx_purch_det on t_purch_det;


alter table t_purch_det 
   drop foreign key fk_purch_purch_det;

alter table t_purch_det 
   drop foreign key fk_book_purch_det;

drop table if exists t_purch_det;

drop index idx_purch on t_purchasing;


alter table t_purchasing 
   drop foreign key fk_publish_purch;

drop table if exists t_purchasing;

drop index idx_retur_det on t_retur_det;


alter table t_retur_det 
   drop foreign key fk_retur_retur_det;

alter table t_retur_det 
   drop foreign key fk_book_retur_det;

drop table if exists t_retur_det;

drop index idx_retur on t_returning;


alter table t_returning 
   drop foreign key fk_member_retur;

drop table if exists t_returning;

/*==============================================================*/
/* Table: book                                                  */
/*==============================================================*/
create table book
(
   bookid               varchar(50) not null  comment '',
   publishid            varchar(50)  comment '',
   catid                varchar(50)  comment '',
   bookcode             varchar(5)  comment '',
   title                varchar(50)  comment '',
   writer               varchar(50)  comment '',
   inyear               varchar(4)  comment '',
   lend_duration        int  comment '',
   prices               decimal(15,2)  comment '',
   primary key (bookid)
);

/*==============================================================*/
/* Index: idx_book                                              */
/*==============================================================*/
create unique index idx_book on book
(
   bookid
);

/*==============================================================*/
/* Table: book_location                                         */
/*==============================================================*/
create table book_location
(
   bookid               varchar(50)  comment '',
   rackid               varchar(50)  comment ''
);

/*==============================================================*/
/* Table: bookshelf                                             */
/*==============================================================*/
create table bookshelf
(
   rackid               varchar(50) not null  comment '',
   location             varchar(255)  comment '',
   primary key (rackid)
);

/*==============================================================*/
/* Index: idx_bookshelf                                         */
/*==============================================================*/
create unique index idx_bookshelf on bookshelf
(
   rackid
);

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   catid                varchar(50) not null  comment '',
   display              varchar(150)  comment '',
   description          varchar(150)  comment '',
   primary key (catid)
);

/*==============================================================*/
/* Index: idx_cat                                               */
/*==============================================================*/
create unique index idx_cat on category
(
   catid
);

/*==============================================================*/
/* Table: ir_apps                                               */
/*==============================================================*/
create table ir_apps
(
   apps                 varchar(50) not null  comment '',
   display              varchar(150)  comment '',
   description          varchar(255)  comment '',
   img                  varchar(255)  comment '',
   isactive             tinyint not null default 1  comment '',
   primary key (apps)
);

/*==============================================================*/
/* Index: idx_apps                                              */
/*==============================================================*/
create unique index idx_apps on ir_apps
(
   apps
);

/*==============================================================*/
/* Table: ir_menus                                              */
/*==============================================================*/
create table ir_menus
(
   menuid               varchar(50) not null  comment '',
   apps                 varchar(50)  comment '',
   parentid             varchar(50)  comment '',
   menu                 varchar(50)  comment '',
   iconurl              varchar(255)  comment '',
   iconfa               varchar(255)  comment '',
   levels               smallint  comment '',
   sorts                smallint  comment '',
   isvisible            tinyint not null default 1  comment '',
   primary key (menuid)
);

/*==============================================================*/
/* Index: idx_menus                                             */
/*==============================================================*/
create unique index idx_menus on ir_menus
(
   menuid
);

/*==============================================================*/
/* Table: members                                               */
/*==============================================================*/
create table members
(
   memberkey            varchar(50) not null  comment '',
   personkey            varchar(50)  comment '',
   uuid                 varchar(50)  comment '',
   scsn                 mediumtext  comment '',
   scci                 mediumtext  comment '',
   primary key (memberkey)
);

/*==============================================================*/
/* Index: idx_members                                           */
/*==============================================================*/
create unique index idx_members on members
(
   memberkey
);

/*==============================================================*/
/* Table: publisher                                             */
/*==============================================================*/
create table publisher
(
   publishid            varchar(50) not null  comment '',
   publisher            varchar(150)  comment '',
   address              varchar(255)  comment '',
   phone                varchar(25)  comment '',
   primary key (publishid)
);

/*==============================================================*/
/* Index: idx_publish                                           */
/*==============================================================*/
create unique index idx_publish on publisher
(
   publishid
);

/*==============================================================*/
/* Table: res_authorize                                         */
/*==============================================================*/
create table res_authorize
(
   authid               varchar(150) not null  comment '',
   description          varchar(255)  comment '',
   levels               smallint  comment '',
   isdev                tinyint not null default 0  comment '',
   primary key (authid)
);

/*==============================================================*/
/* Index: idx_auth                                              */
/*==============================================================*/
create unique index idx_auth on res_authorize
(
   authid
);

/*==============================================================*/
/* Table: res_authorole                                         */
/*==============================================================*/
create table res_authorole
(
   authid               varchar(150)  comment '',
   menuid               varchar(50)  comment '',
   allowview            tinyint not null default 1  comment '',
   allowcreate          tinyint not null default 1  comment '',
   allowedit            tinyint not null default 1  comment '',
   allowdelete          tinyint not null default 1  comment '',
   allowexport          tinyint not null default 1  comment '',
   allowimport          tinyint not null default 1  comment ''
);

/*==============================================================*/
/* Table: res_persons                                           */
/*==============================================================*/
create table res_persons
(
   personkey            varchar(50) not null  comment '',
   fullname             varchar(255)  comment '',
   email                varchar(50)  comment '',
   hp                   varchar(25)  comment '',
   isdev                tinyint not null default 0  comment '',
   primary key (personkey)
);

/*==============================================================*/
/* Index: idx_persons                                           */
/*==============================================================*/
create unique index idx_persons on res_persons
(
   personkey
);

/*==============================================================*/
/* Table: res_users                                             */
/*==============================================================*/
create table res_users
(
   userid               varchar(50) not null  comment '',
   personkey            varchar(50)  comment '',
   authid               varchar(150)  comment '',
   passwords            varchar(500)  comment '',
   status               varchar(20)  comment '',
   suspendate           datetime  comment '',
   primary key (userid)
);

/*==============================================================*/
/* Index: idx_users                                             */
/*==============================================================*/
create unique index idx_users on res_users
(
   userid
);

/*==============================================================*/
/* Table: t_lend_det                                            */
/*==============================================================*/
create table t_lend_det
(
   rowid                varchar(50) not null  comment '',
   lendid               varchar(50)  comment '',
   bookid               varchar(50)  comment '',
   qty                  decimal(6,2)  comment '',
   datelend             datetime  comment '',
   dateretur            datetime  comment '',
   prices               decimal(15,2)  comment '',
   primary key (rowid)
);

/*==============================================================*/
/* Index: idx_lend_det                                          */
/*==============================================================*/
create unique index idx_lend_det on t_lend_det
(
   rowid
);

/*==============================================================*/
/* Table: t_lending                                             */
/*==============================================================*/
create table t_lending
(
   lendid               varchar(50) not null  comment '',
   memberkey            varchar(50)  comment '',
   datetrans            datetime  comment '',
   t_prices             decimal(15,2)  comment '',
   userid               varchar(50)  comment '',
   primary key (lendid)
);

/*==============================================================*/
/* Index: idx_lend                                              */
/*==============================================================*/
create unique index idx_lend on t_lending
(
   lendid
);

/*==============================================================*/
/* Table: t_purch_det                                           */
/*==============================================================*/
create table t_purch_det
(
   rowid                varchar(50) not null  comment '',
   purchid              varchar(50)  comment '',
   bookid               varchar(50)  comment '',
   qty                  decimal(6,2)  comment '',
   primary key (rowid)
);

/*==============================================================*/
/* Index: idx_purch_det                                         */
/*==============================================================*/
create unique index idx_purch_det on t_purch_det
(
   rowid
);

/*==============================================================*/
/* Table: t_purchasing                                          */
/*==============================================================*/
create table t_purchasing
(
   purchid              varchar(50) not null  comment '',
   publishid            varchar(50)  comment '',
   datetrans            datetime  comment '',
   userid               varchar(50)  comment '',
   primary key (purchid)
);

/*==============================================================*/
/* Index: idx_purch                                             */
/*==============================================================*/
create unique index idx_purch on t_purchasing
(
   purchid
);

/*==============================================================*/
/* Table: t_retur_det                                           */
/*==============================================================*/
create table t_retur_det
(
   rowid                varchar(50) not null  comment '',
   returid              varchar(50)  comment '',
   bookid               varchar(50)  comment '',
   qty                  decimal(6,2)  comment '',
   datelend             datetime  comment '',
   dateretur            datetime  comment '',
   penalty              int  comment '',
   t_penalty            decimal(15,2)  comment '',
   primary key (rowid)
);

/*==============================================================*/
/* Index: idx_retur_det                                         */
/*==============================================================*/
create unique index idx_retur_det on t_retur_det
(
   rowid
);

/*==============================================================*/
/* Table: t_returning                                           */
/*==============================================================*/
create table t_returning
(
   returid              varchar(50) not null  comment '',
   memberkey            varchar(50)  comment '',
   datetrans            datetime  comment '',
   t_prices             decimal(15,2)  comment '',
   userid               varchar(50)  comment '',
   primary key (returid)
);

/*==============================================================*/
/* Index: idx_retur                                             */
/*==============================================================*/
create unique index idx_retur on t_returning
(
   returid
);

alter table book add constraint fk_book_categ foreign key (catid)
      references category (catid) on delete cascade on update cascade;

alter table book add constraint fk_book_publish foreign key (publishid)
      references publisher (publishid) on delete cascade on update cascade;

alter table book_location add constraint fk_locat_book foreign key (bookid)
      references book (bookid) on delete cascade on update cascade;

alter table book_location add constraint fk_locat_bookshelf foreign key (rackid)
      references bookshelf (rackid) on delete cascade on update cascade;

alter table ir_menus add constraint fk_apps_menus foreign key (apps)
      references ir_apps (apps) on delete cascade on update cascade;

alter table members add constraint fk_persons_members foreign key (personkey)
      references res_persons (personkey) on delete cascade on update cascade;

alter table res_authorole add constraint fk_author_authrole foreign key (authid)
      references res_authorize (authid) on delete cascade on update cascade;

alter table res_authorole add constraint fk_menus_author foreign key (menuid)
      references ir_menus (menuid) on delete cascade on update cascade;

alter table res_users add constraint fk_author_users foreign key (authid)
      references res_authorize (authid) on delete cascade on update cascade;

alter table res_users add constraint fk_person_users foreign key (personkey)
      references res_persons (personkey) on delete cascade on update cascade;

alter table t_lend_det add constraint fk_book_lend_det foreign key (bookid)
      references book (bookid) on delete cascade on update cascade;

alter table t_lend_det add constraint fk_lend_lend_det foreign key (lendid)
      references t_lending (lendid) on delete cascade on update cascade;

alter table t_lending add constraint fk_member_lend foreign key (memberkey)
      references members (memberkey) on delete cascade on update cascade;

alter table t_purch_det add constraint fk_book_purch_det foreign key (bookid)
      references book (bookid) on delete cascade on update cascade;

alter table t_purch_det add constraint fk_purch_purch_det foreign key (purchid)
      references t_purchasing (purchid) on delete cascade on update cascade;

alter table t_purchasing add constraint fk_publish_purch foreign key (publishid)
      references publisher (publishid) on delete cascade on update cascade;

alter table t_retur_det add constraint fk_book_retur_det foreign key (bookid)
      references book (bookid) on delete cascade on update cascade;

alter table t_retur_det add constraint fk_retur_retur_det foreign key (returid)
      references t_returning (returid) on delete cascade on update cascade;

alter table t_returning add constraint fk_member_retur foreign key (memberkey)
      references members (memberkey) on delete cascade on update cascade;


DELIMITER $$
CREATE FUNCTION f_key_gen()
RETURNS VARCHAR(50)
BEGIN
    DECLARE retVal VARCHAR(50) DEFAULT '';

    SELECT CONCAT(CAST(LEFT(UPPER(MD5(YEAR(SYSDATE(6)))),20) AS VARCHAR(5)),'-',CAST(LEFT(UPPER(MD5(SYSDATE(6))),20) AS VARCHAR(10))) INTO retVal;

	RETURN retVal;
END$$;


DELIMITER $$
CREATE PROCEDURE p_apps_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_apps_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_apps_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_authorize_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_authorize_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_authorize_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_authorole_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_authorole_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_authorole_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_book_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_book_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_book_location_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_book_location_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_book_location_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_book_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_bookshelf_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_bookshelf_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_bookshelf_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_category_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_category_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_category_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_lend_det_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_lend_det_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_lend_det_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_lending_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_lending_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_lending_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_members_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_members_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_members_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_menus_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_menus_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_menus_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_persons_ins (

)
BEGIN
    -- Declare variables to hold diagnostics area information
	DECLARE ERRCODE CHAR(5) DEFAULT '00000';
	DECLARE MSG VARCHAR(255) DEFAULT 'Failed: -';
	DECLARE avail INT DEFAULT 0;

	-- Declare exception handler for failed insert
	DECLARE err_handler CONDITION FOR SQLSTATE '45000';
		DECLARE EXIT HANDLER FOR err_handler
			IF(ERRCODE = '00001')THEN
				SET MSG = CONCAT('Failed: Partner ', p_partnerKey,' data is was available.');
				RESIGNAL SET MESSAGE_TEXT = MSG;
			ELSEIF(ERRCODE = '00002')THEN
				SET MSG = CONCAT('Failed: please filled Partner Key.');
				RESIGNAL SET MESSAGE_TEXT = MSG;
			END IF;
			
	IF(COALESCE(p_partnerKey,'') = '') THEN
			SET ERRCODE = '00002';
			SIGNAL err_handler;
	END IF;

	START TRANSACTION;
	
	SELECT COUNT(1) INTO avail FROM res_partner
	WHERE PartnerKey=p_partnerKey;

	IF(avail = 0) THEN
			
			INSERT IGNORE INTO res_partner(PartnerKey,PartnerTypeKey,PartnerName,Prefix)
				VALUES(p_partnerKey,p_partnerTypeKey,p_partnerName,p_prefix);
			COMMIT;
			
	ELSE
			SET ERRCODE = '00001';
			SIGNAL err_handler;
	END IF;
END$$;


DELIMITER $$
CREATE PROCEDURE p_persons_list (

)
BEGIN
    -- Declare variables to hold diagnostics area information
	DECLARE ERRCODE CHAR(5) DEFAULT '00000';
	DECLARE MSG VARCHAR(255) DEFAULT 'Failed: -';
	DECLARE avail INT DEFAULT 0;

	-- Declare exception handler for failed insert
	DECLARE err_handler CONDITION FOR SQLSTATE '45000';
		DECLARE EXIT HANDLER FOR err_handler
			IF(ERRCODE = '00001')THEN
				SET MSG = CONCAT('Failed: Partner ', p_partnerKey,' data is was available.');
				RESIGNAL SET MESSAGE_TEXT = MSG;
			ELSEIF(ERRCODE = '00002')THEN
				SET MSG = CONCAT('Failed: please filled Partner Key.');
				RESIGNAL SET MESSAGE_TEXT = MSG;
			END IF;
			
	IF(COALESCE(p_partnerKey,'') = '') THEN
			SET ERRCODE = '00002';
			SIGNAL err_handler;
	END IF;

	START TRANSACTION;
	
	SELECT COUNT(1) INTO avail FROM res_partner
	WHERE PartnerKey=p_partnerKey;

	IF(avail = 0) THEN
			
			INSERT IGNORE INTO res_partner(PartnerKey,PartnerTypeKey,PartnerName,Prefix)
				VALUES(p_partnerKey,p_partnerTypeKey,p_partnerName,p_prefix);
			COMMIT;
			
	ELSE
			SET ERRCODE = '00001';
			SIGNAL err_handler;
	END IF;
END$$;


DELIMITER $$
CREATE PROCEDURE p_persons_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_publisher_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_publisher_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_publisher_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_purch_det_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_purch_det_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_purch_det_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_purchasing_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_purchasing_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_purchasing_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_retur_det_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_retur_det_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_retur_det_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_returning_ins (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_returning_list (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_returning_upd (

)
BEGIN



END$$;


DELIMITER $$
CREATE PROCEDURE p_users_ins (

)
BEGIN
    -- Declare variables to hold diagnostics area information
	DECLARE ERRCODE CHAR(5) DEFAULT '00000';
	DECLARE MSG VARCHAR(255) DEFAULT 'Failed: -';
	DECLARE avail INT DEFAULT 0;

	-- Declare exception handler for failed insert
	DECLARE err_handler CONDITION FOR SQLSTATE '45000';
		DECLARE EXIT HANDLER FOR err_handler
			IF(ERRCODE = '00001')THEN
				SET MSG = CONCAT('Failed: Partner ', p_partnerKey,' data is was available.');
				RESIGNAL SET MESSAGE_TEXT = MSG;
			ELSEIF(ERRCODE = '00002')THEN
				SET MSG = CONCAT('Failed: please filled Partner Key.');
				RESIGNAL SET MESSAGE_TEXT = MSG;
			END IF;
			
	IF(COALESCE(p_partnerKey,'') = '') THEN
			SET ERRCODE = '00002';
			SIGNAL err_handler;
	END IF;

	START TRANSACTION;
	
	SELECT COUNT(1) INTO avail FROM res_partner
	WHERE PartnerKey=p_partnerKey;

	IF(avail = 0) THEN
			
			INSERT IGNORE INTO res_partner(PartnerKey,PartnerTypeKey,PartnerName,Prefix)
				VALUES(p_partnerKey,p_partnerTypeKey,p_partnerName,p_prefix);
			COMMIT;
			
	ELSE
			SET ERRCODE = '00001';
			SIGNAL err_handler;
	END IF;
END$$;


DELIMITER $$
CREATE PROCEDURE p_users_list (

)
BEGIN
    -- Declare variables to hold diagnostics area information
	DECLARE ERRCODE CHAR(5) DEFAULT '00000';
	DECLARE MSG VARCHAR(255) DEFAULT 'Failed: -';
	DECLARE avail INT DEFAULT 0;

	-- Declare exception handler for failed insert
	DECLARE err_handler CONDITION FOR SQLSTATE '45000';
		DECLARE EXIT HANDLER FOR err_handler
			IF(ERRCODE = '00001')THEN
				SET MSG = CONCAT('Failed: Partner ', p_partnerKey,' data is was available.');
				RESIGNAL SET MESSAGE_TEXT = MSG;
			ELSEIF(ERRCODE = '00002')THEN
				SET MSG = CONCAT('Failed: please filled Partner Key.');
				RESIGNAL SET MESSAGE_TEXT = MSG;
			END IF;
			
	IF(COALESCE(p_partnerKey,'') = '') THEN
			SET ERRCODE = '00002';
			SIGNAL err_handler;
	END IF;

	START TRANSACTION;
	
	SELECT COUNT(1) INTO avail FROM res_partner
	WHERE PartnerKey=p_partnerKey;

	IF(avail = 0) THEN
			
			INSERT IGNORE INTO res_partner(PartnerKey,PartnerTypeKey,PartnerName,Prefix)
				VALUES(p_partnerKey,p_partnerTypeKey,p_partnerName,p_prefix);
			COMMIT;
			
	ELSE
			SET ERRCODE = '00001';
			SIGNAL err_handler;
	END IF;
END$$;


DELIMITER $$
CREATE PROCEDURE p_users_upd (

)
BEGIN



END$$;

