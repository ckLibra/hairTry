/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2018-12-30 12:08:29                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Face_Model') and o.name = 'FK_FACE_MOD_BUILD_PHOTO')
alter table Face_Model
   drop constraint FK_FACE_MOD_BUILD_PHOTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Photo') and o.name = 'FK_PHOTO_OWN_USER')
alter table Photo
   drop constraint FK_PHOTO_OWN_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Preference') and o.name = 'FK_PREFEREN_PREFERENC_HAIR')
alter table Preference
   drop constraint FK_PREFEREN_PREFERENC_HAIR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Preference') and o.name = 'FK_PREFEREN_PREFERENC_USER')
alter table Preference
   drop constraint FK_PREFEREN_PREFERENC_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Try') and o.name = 'FK_TRY_TRY_FACE_MOD')
alter table Try
   drop constraint FK_TRY_TRY_FACE_MOD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Try') and o.name = 'FK_TRY_TRY_HAIR')
alter table Try
   drop constraint FK_TRY_TRY_HAIR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Try') and o.name = 'FK_TRY_TRY_USER')
alter table Try
   drop constraint FK_TRY_TRY_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('recommend') and o.name = 'FK_RECOMMEN_RECOMMEND_HAIR')
alter table recommend
   drop constraint FK_RECOMMEN_RECOMMEND_HAIR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('recommend') and o.name = 'FK_RECOMMEN_RECOMMEND_PHOTO')
alter table recommend
   drop constraint FK_RECOMMEN_RECOMMEND_PHOTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Face_Model')
            and   name  = 'build_FK'
            and   indid > 0
            and   indid < 255)
   drop index Face_Model.build_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Face_Model')
            and   type = 'U')
   drop table Face_Model
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Hair')
            and   type = 'U')
   drop table Hair
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Photo')
            and   name  = 'own_FK'
            and   indid > 0
            and   indid < 255)
   drop index Photo.own_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Photo')
            and   type = 'U')
   drop table Photo
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Preference')
            and   name  = 'Preference_FK2'
            and   indid > 0
            and   indid < 255)
   drop index Preference.Preference_FK2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Preference')
            and   name  = 'Preference_FK'
            and   indid > 0
            and   indid < 255)
   drop index Preference.Preference_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Preference')
            and   type = 'U')
   drop table Preference
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Try')
            and   name  = 'Try_FK3'
            and   indid > 0
            and   indid < 255)
   drop index Try.Try_FK3
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Try')
            and   name  = 'Try_FK2'
            and   indid > 0
            and   indid < 255)
   drop index Try.Try_FK2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Try')
            and   name  = 'Try_FK'
            and   indid > 0
            and   indid < 255)
   drop index Try.Try_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Try')
            and   type = 'U')
   drop table Try
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"User"')
            and   type = 'U')
   drop table "User"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('recommend')
            and   name  = 'recommend_FK2'
            and   indid > 0
            and   indid < 255)
   drop index recommend.recommend_FK2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('recommend')
            and   name  = 'recommend_FK'
            and   indid > 0
            and   indid < 255)
   drop index recommend.recommend_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('recommend')
            and   type = 'U')
   drop table recommend
go

/*==============================================================*/
/* Table: Face_Model                                            */
/*==============================================================*/
create table Face_Model (
   face_id              char(10)             not null,
   photo_id             char(10)             null,
   face_texture_url     char(150)            not null,
   face_model_url       char(150)            not null,
   constraint PK_FACE_MODEL primary key nonclustered (face_id)
)
go

/*==============================================================*/
/* Index: build_FK                                              */
/*==============================================================*/
create index build_FK on Face_Model (
photo_id ASC
)
go

/*==============================================================*/
/* Table: Hair                                                  */
/*==============================================================*/
create table Hair (
   hair_id              char(10)             not null,
   hair_geometry        char(150)            not null,
   hair_name            char(10)             not null,
   hair_texture         char(150)            not null,
   sex                  char(10)             null,
   hair_type            char(10)             not null,
   constraint PK_HAIR primary key nonclustered (hair_id)
)
go

/*==============================================================*/
/* Table: Photo                                                 */
/*==============================================================*/
create table Photo (
   photo_id             char(10)             not null,
   user_id              char(10)             null,
   face_shape           smallint             null,
   photo_url            char(150)            null,
   constraint PK_PHOTO primary key nonclustered (photo_id)
)
go

/*==============================================================*/
/* Index: own_FK                                                */
/*==============================================================*/
create index own_FK on Photo (
user_id ASC
)
go

/*==============================================================*/
/* Table: Preference                                            */
/*==============================================================*/
create table Preference (
   user_id              char(10)             not null,
   hair_id              char(10)             not null,
   click_times          int                  not null,
   constraint PK_PREFERENCE primary key nonclustered (user_id, hair_id)
)
go

/*==============================================================*/
/* Index: Preference_FK                                         */
/*==============================================================*/
create index Preference_FK on Preference (
user_id ASC
)
go

/*==============================================================*/
/* Index: Preference_FK2                                        */
/*==============================================================*/
create index Preference_FK2 on Preference (
hair_id ASC
)
go

/*==============================================================*/
/* Table: Try                                                   */
/*==============================================================*/
create table Try (
   hair_id              char(10)             not null,
   user_id              char(10)             not null,
   face_id              char(10)             not null,
   try_id               char(10)             not null,
   try_data             datetime             null,
   hair_color           char(15)             not null,
   hair_length          char(15)             null,
   constraint PK_TRY primary key nonclustered (hair_id, user_id, face_id)
)
go

/*==============================================================*/
/* Index: Try_FK                                                */
/*==============================================================*/
create index Try_FK on Try (
hair_id ASC
)
go

/*==============================================================*/
/* Index: Try_FK2                                               */
/*==============================================================*/
create index Try_FK2 on Try (
user_id ASC
)
go

/*==============================================================*/
/* Index: Try_FK3                                               */
/*==============================================================*/
create index Try_FK3 on Try (
face_id ASC
)
go

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" (
   user_id              char(10)             not null,
   user_name            char(20)             not null,
   password             char(15)             not null,
   constraint PK_USER primary key nonclustered (user_id)
)
go

/*==============================================================*/
/* Table: recommend                                             */
/*==============================================================*/
create table recommend (
   hair_id              char(10)             not null,
   photo_id             char(10)             not null,
   recommend_degree     float                null,
   constraint PK_RECOMMEND primary key nonclustered (hair_id, photo_id)
)
go

/*==============================================================*/
/* Index: recommend_FK                                          */
/*==============================================================*/
create index recommend_FK on recommend (
hair_id ASC
)
go

/*==============================================================*/
/* Index: recommend_FK2                                         */
/*==============================================================*/
create index recommend_FK2 on recommend (
photo_id ASC
)
go

alter table Face_Model
   add constraint FK_FACE_MOD_BUILD_PHOTO foreign key (photo_id)
      references Photo (photo_id)
go

alter table Photo
   add constraint FK_PHOTO_OWN_USER foreign key (user_id)
      references "User" (user_id)
go

alter table Preference
   add constraint FK_PREFEREN_PREFERENC_HAIR foreign key (hair_id)
      references Hair (hair_id)
go

alter table Preference
   add constraint FK_PREFEREN_PREFERENC_USER foreign key (user_id)
      references "User" (user_id)
go

alter table Try
   add constraint FK_TRY_TRY_FACE_MOD foreign key (face_id)
      references Face_Model (face_id)
go

alter table Try
   add constraint FK_TRY_TRY_HAIR foreign key (hair_id)
      references Hair (hair_id)
go

alter table Try
   add constraint FK_TRY_TRY_USER foreign key (user_id)
      references "User" (user_id)
go

alter table recommend
   add constraint FK_RECOMMEN_RECOMMEND_HAIR foreign key (hair_id)
      references Hair (hair_id)
go

alter table recommend
   add constraint FK_RECOMMEN_RECOMMEND_PHOTO foreign key (photo_id)
      references Photo (photo_id)
go

