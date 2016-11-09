/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/10/17 19:07:56                          */
/*==============================================================*/


drop table if exists Article;

drop table if exists RoleTable;

drop table if exists UserGroup;

drop table if exists UserTable;

/*==============================================================*/
/* Table: RoleTable                                             */
/*==============================================================*/
create table RoleTable
(
   R_Id                 int not null,
   R_type               varchar(10),
   primary key (R_Id)
);

/*==============================================================*/
/* Table: UserGroup                                             */
/*==============================================================*/
create table UserGroup
(
   G_Id                 int not null,
   G_Name               varchar(10),
   primary key (G_Id)
);

/*==============================================================*/
/* Table: UserTable                                             */
/*==============================================================*/
create table UserTable
(
   U_Id                 int not null,
   G_Id                 int,
   R_Id                 int,
   U_account            varchar(16),
   U_password           varchar(16),
   U_nickname           varchar(12),
   U_score              int,
   primary key (U_Id),
   constraint FK_Relationship_1 foreign key (R_Id)
      references RoleTable (R_Id) on delete restrict on update restrict,
   constraint FK_Relationship_3 foreign key (G_Id)
      references UserGroup (G_Id) on delete restrict on update restrict
);

/*==============================================================*/
/* Table: Article                                               */
/*==============================================================*/
create table Article
(
   A_Id                 int not null,
   U_Id                 int,
   A_title              varchar(20),
   A_URL                text,
   A_type               varchar(20),
   A_time               date,
   A_reading_amount     bigint,
   primary key (A_Id),
   constraint FK_Relationship_4 foreign key (U_Id)
      references UserTable (U_Id) on delete restrict on update restrict
);

