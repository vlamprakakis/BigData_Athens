-- CREATION OF GIS DATABASE
CREATE DATABASE "GIS"
    WITH 
    OWNER = vassilis
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- sql script for kadous table

CREATE TABLE public.kadoi
(
    x character varying(20) COLLATE pg_catalog."default",
    y character varying(20) COLLATE pg_catalog."default",
    id smallint NOT NULL,
    area_en character varying(50) COLLATE pg_catalog."default",
    area_gr character varying(20) COLLATE pg_catalog."default",
    area_id smallint,
    descr character varying(100) COLLATE pg_catalog."default",
    block_id smallint,
    per_pop smallint,
    CONSTRAINT kadoi_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.kadoi
    OWNER to vassilis;

-- sql script for theaters table
CREATE TABLE public.theaters
(
    fid smallint NOT NULL,
    eponymia character varying(100) COLLATE pg_catalog."default",
    perigrafi character varying(100) COLLATE pg_catalog."default",
    dieuthinsi character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT theaters_pkey PRIMARY KEY (fid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.theaters
    OWNER to vassilis;
	
-- table fotismos tis polis
CREATE TABLE public.fotismos
(
    fid integer NOT NULL,
    id_i integer,
    x character varying(25) COLLATE pg_catalog."default",
    y character varying(25) COLLATE pg_catalog."default",
    kat_istou character varying(100) COLLATE pg_catalog."default",
    onom_odou character varying(100) COLLATE pg_catalog."default",
    typos_odou character varying(50) COLLATE pg_catalog."default",
    kateuthnsi character varying(20) COLLATE pg_catalog."default",
    eid_istou character varying(25) COLLATE pg_catalog."default",
    thesis_ist character varying(15) COLLATE pg_catalog."default",
    ypsos_isto real,
    typos_fot character varying(50) COLLATE pg_catalog."default",
    katastasis character varying(30) COLLATE pg_catalog."default",
    typos_lamp character varying(30) COLLATE pg_catalog."default",
    isxis_lamp smallint,
    ypsos_lamp real,
    fotografia character varying(150) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.fotismos
    OWNER to vassilis;	

