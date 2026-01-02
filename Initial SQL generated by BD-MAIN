-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Mon Nov  3 08:58:02 2025 
-- * LUN file: C:\Users\Mohamed\Downloads\Projet Mod Base de données_v1.lun 
-- * Schema: Modèle Conceptuel de Données /SQL 
-- ********************************************* 


-- Database Section
-- ________________ 

create database Modèle Conceptuel de Données ;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table Championship (
     ID_Competition numeric(10) not null,
     constraint ID_Champ_Compe_ID primary key (ID_Competition));

create table Citizenship (
     ID_player numeric(50) not null,
     Citizenship varchar(55) not null,
     constraint ID_Citizenship_ID primary key (ID_player, Citizenship));

create table Club (
     ID_club numeric(50) not null,
     name varchar(55) not null,
     city varchar(55) not null,
     constraint ID_Club_ID primary key (ID_club));

create table Company (
     ID_sponsor numeric(10) not null,
     constraint ID_Compa_Spons_ID primary key (ID_sponsor));

create table Competition (
     ID_Competition numeric(10) not null,
     League numeric(10),
     Championship numeric(10),
     constraint ID_Competition_ID primary key (ID_Competition));

create table Game (
     ID_game numeric(10) not null,
     ID_Competition numeric(10) not null,
     constraint ID_Game_ID primary key (ID_game));

create table hosts (
     ID_Tea numeric(10) not null,
     ID_game numeric(10) not null,
     constraint ID_hosts_ID primary key (ID_game, ID_Tea));

create table League (
     ID_Competition numeric(10) not null,
     constraint ID_Leagu_Compe_ID primary key (ID_Competition));

create table National_Team (
     ID_national_team numeric(10) not null,
     Country varchar(50) not null,
     constraint ID_National_Team_ID primary key (ID_national_team));

create table Successfull (
     ID_player numeric(50) not null,
     ID_game numeric(10) not null,
     constraint ID_Succe_Playe_ID primary key (ID_player, ID_game));

create table All (
     ID_player numeric(50) not null,
     ID_game numeric(10) not null,
     Fouls numeric(10) not null,
     constraint ID_All_Playe_ID primary key (ID_player, ID_game));

create table Players_performance_in_the_game (
     ID_game numeric(10) not null,
     ID_player numeric(50) not null,
     3_pts_throws numeric(10) not null,
     2_pts_throws numeric(10) not null,
     free_throws numeric(10) not null,
     assists numeric(10) not null,
     rebounds numeric(10) not null,
     blocks numeric(10) not null,
     constraint ID_Players_performance_in_the_game_ID primary key (ID_player, ID_game));

create table Person (
     ID_sponsor numeric(10) not null,
     constraint ID_Perso_Spons_ID primary key (ID_sponsor));

create table Player (
     ID_player numeric(50) not null,
     Name varchar(55) not null,
     Date_of_birth date not null,
     Height float(10) not null,
     constraint ID_Player_ID primary key (ID_player));

create table plays/played (
     ID_Tea numeric(10) not null,
     ID_player numeric(50) not null,
     start_date date not null,
     end_date date not null,
     constraint ID_plays/played_ID primary key (ID_Tea, ID_player));

create table Season (
     ID_season numeric(10) not null,
     Start_Date date not null,
     End_Date date not null,
     ID_Competition numeric(10) not null,
     constraint ID_Season_ID primary key (ID_season));

create table Sponsor (
     ID_sponsor numeric(10) not null,
     city varchar(55) not null,
     name char(1) not null,
     Person numeric(10),
     Company numeric(10),
     constraint ID_Sponsor_ID primary key (ID_sponsor));

create table sponsoring_contract (
     ID_Tea numeric(10) not null,
     ID_sponsor numeric(10) not null,
     start_date date not null,
     end_date date not null,
     amount float(10) not null,
     constraint ID_sponsoring_contract_ID primary key (ID_Tea, ID_sponsor));

create table Team (
     ID_Tea -- Sequence attribute not implemented -- not null,
     ID_national_team numeric(10),
     ID_club numeric(50),
     constraint ID_Team_ID primary key (ID_Tea),
     constraint SID_Team_Natio_ID unique (ID_national_team),
     constraint SID_Team_Club_ID unique (ID_club));


-- Constraints Section
-- ___________________ 

alter table Championship add constraint ID_Champ_Compe_FK
     foreign key (ID_Competition)
     references Competition;

alter table Citizenship add constraint EQU_Citiz_Playe
     foreign key (ID_player)
     references Player;

alter table Club add constraint ID_Club_CHK
     check(exists(select * from Team
                  where Team.ID_club = ID_club)); 

alter table Company add constraint ID_Compa_Spons_FK
     foreign key (ID_sponsor)
     references Sponsor;

alter table Competition add constraint ID_Competition_CHK
     check(exists(select * from Game
                  where Game.ID_Competition = ID_Competition)); 

alter table Competition add constraint EXTONE_Competition
     check((League is not null and Championship is null)
           or (League is null and Championship is not null)); 

alter table Game add constraint ID_Game_CHK
     check(exists(select * from hosts
                  where hosts.ID_game = ID_game)); 

alter table Game add constraint ID_Game_CHK
     check(exists(select * from Players_performance_in_the_game
                  where Players_performance_in_the_game.ID_game = ID_game)); 

alter table Game add constraint EQU_Game_Compe_FK
     foreign key (ID_Competition)
     references Competition;

alter table hosts add constraint EQU_hosts_Game
     foreign key (ID_game)
     references Game;

alter table hosts add constraint REF_hosts_Team_FK
     foreign key (ID_Tea)
     references Team;

alter table League add constraint ID_Leagu_Compe_CHK
     check(exists(select * from Season
                  where Season.ID_Competition = ID_Competition)); 

alter table League add constraint ID_Leagu_Compe_FK
     foreign key (ID_Competition)
     references Competition;

alter table National_Team add constraint ID_National_Team_CHK
     check(exists(select * from Team
                  where Team.ID_national_team = ID_national_team)); 

alter table Successfull add constraint ID_Succe_Playe_FK
     foreign key (ID_player, ID_game)
     references Players_performance_in_the_game;

alter table All add constraint ID_All_Playe_FK
     foreign key (ID_player, ID_game)
     references Players_performance_in_the_game;

alter table Players_performance_in_the_game add constraint REF_Playe_Playe
     foreign key (ID_player)
     references Player;

alter table Players_performance_in_the_game add constraint EQU_Playe_Game_FK
     foreign key (ID_game)
     references Game;

alter table Person add constraint ID_Perso_Spons_FK
     foreign key (ID_sponsor)
     references Sponsor;

alter table Player add constraint ID_Player_CHK
     check(exists(select * from Citizenship
                  where Citizenship.ID_player = ID_player)); 

alter table Player add constraint ID_Player_CHK
     check(exists(select * from plays/played
                  where plays/played.ID_player = ID_player)); 

alter table plays/played add constraint EQU_plays_Playe_FK
     foreign key (ID_player)
     references Player;

alter table plays/played add constraint EQU_plays_Team
     foreign key (ID_Tea)
     references Team;

alter table Season add constraint EQU_Seaso_Leagu_FK
     foreign key (ID_Competition)
     references League;

alter table Sponsor add constraint ID_Sponsor_CHK
     check(exists(select * from sponsoring_contract
                  where sponsoring_contract.ID_sponsor = ID_sponsor)); 

alter table Sponsor add constraint EXTONE_Sponsor
     check((Company is not null and Person is null)
           or (Company is null and Person is not null)); 

alter table sponsoring_contract add constraint EQU_spons_Spons_FK
     foreign key (ID_sponsor)
     references Sponsor;

alter table sponsoring_contract add constraint REF_spons_Team
     foreign key (ID_Tea)
     references Team;

alter table Team add constraint ID_Team_CHK
     check(exists(select * from plays/played
                  where plays/played.ID_Tea = ID_Tea)); 

alter table Team add constraint EXTONE_Team
     check((ID_national_team is not null and ID_club is null)
           or (ID_national_team is null and ID_club is not null)); 

alter table Team add constraint SID_Team_Natio_FK
     foreign key (ID_national_team)
     references National_Team;

alter table Team add constraint SID_Team_Club_FK
     foreign key (ID_club)
     references Club;


-- Index Section
-- _____________ 

create unique index ID_Champ_Compe_IND
     on Championship (ID_Competition);

create unique index ID_Citizenship_IND
     on Citizenship (ID_player, Citizenship);

create unique index ID_Club_IND
     on Club (ID_club);

create unique index ID_Compa_Spons_IND
     on Company (ID_sponsor);

create unique index ID_Competition_IND
     on Competition (ID_Competition);

create unique index ID_Game_IND
     on Game (ID_game);

create index EQU_Game_Compe_IND
     on Game (ID_Competition);

create unique index ID_hosts_IND
     on hosts (ID_game, ID_Tea);

create index REF_hosts_Team_IND
     on hosts (ID_Tea);

create unique index ID_Leagu_Compe_IND
     on League (ID_Competition);

create unique index ID_National_Team_IND
     on National_Team (ID_national_team);

create unique index ID_Succe_Playe_IND
     on Successfull (ID_player, ID_game);

create unique index ID_All_Playe_IND
     on All (ID_player, ID_game);

create unique index ID_Players_performance_in_the_game_IND
     on Players_performance_in_the_game (ID_player, ID_game);

create index EQU_Playe_Game_IND
     on Players_performance_in_the_game (ID_game);

create unique index ID_Perso_Spons_IND
     on Person (ID_sponsor);

create unique index ID_Player_IND
     on Player (ID_player);

create unique index ID_plays/played_IND
     on plays/played (ID_Tea, ID_player);

create index EQU_plays_Playe_IND
     on plays/played (ID_player);

create unique index ID_Season_IND
     on Season (ID_season);

create index EQU_Seaso_Leagu_IND
     on Season (ID_Competition);

create unique index ID_Sponsor_IND
     on Sponsor (ID_sponsor);

create unique index ID_sponsoring_contract_IND
     on sponsoring_contract (ID_Tea, ID_sponsor);

create index EQU_spons_Spons_IND
     on sponsoring_contract (ID_sponsor);

create unique index ID_Team_IND
     on Team (ID_Tea);

create unique index SID_Team_Natio_IND
     on Team (ID_national_team);

create unique index SID_Team_Club_IND
     on Team (ID_club);

