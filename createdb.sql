create database mydb;
create user mydb with nosuperuser password 'mydb';
alter database mydb owner to mydb;
grant all on DATABASE mydb to mydb;

\c mydb;

begin;

create table users (
        id integer primary key,
        name varchar(100) NOT NULL
);

ALTER TABLE users OWNER TO mydb;

insert into users  values (1, 'cassio1');
insert into users  values (2, 'cassio2');
insert into users  values (3, 'cassio3');
insert into users  values (4, 'cassio4');
insert into users  values (5, 'cassio5');

commit;
