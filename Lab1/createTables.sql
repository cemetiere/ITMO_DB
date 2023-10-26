DROP TABLE IF EXISTS Astronomer CASCADE;
DROP TABLE IF EXISTS Telescope CASCADE;
DROP TABLE IF EXISTS Watch CASCADE;
DROP TABLE IF EXISTS Observation CASCADE;
DROP TABLE IF EXISTS Celestial_body CASCADE;
DROP TABLE IF EXISTS CB_type CASCADE;
DROP TABLE IF EXISTS Coordinates CASCADE;


CREATE TABLE Astronomer(
    ID serial primary key,
    name varchar(50) not null,
    surname varchar(50) not null
);
CREATE TABLE Telescope(
    ID serial primary key,
    astronomer_id integer UNIQUE REFERENCES Astronomer(ID),

    name varchar(50) not null,
    series integer not null,
    number integer not null,
    date_of_release date
);
CREATE TABLE CB_type(
    ID serial primary key,
    name varchar(50) not null
);
CREATE TABLE Celestial_body(
    ID serial primary key,
    name varchar(50) not null,
    type integer REFERENCES CB_type(ID)
);
CREATE TABLE Watch(
    ID serial primary key,
    name varchar(50) not null,
    celestial_body integer REFERENCES Celestial_body(ID) not null
);

CREATE TABLE Coordinates(
    ID serial primary key,
    x integer not null,
    y integer not null,
    z integer not null,
    coordinate_date date not null,
    celestial_body integer REFERENCES Celestial_body(ID) not null
);
CREATE TABLE Observation(
    ID serial primary key,
    astronomer integer REFERENCES Astronomer(ID) not null,
    observed_cb integer REFERENCES Celestial_body(ID) not null,
    watch integer REFERENCES Watch(ID) not null
);
