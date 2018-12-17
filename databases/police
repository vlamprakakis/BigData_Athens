-- MUNICIPAL POLICE DATABASE
CREATE DATABASE police
    WITH 
    OWNER = vassilis
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- TOTAL data table creation for MUNICIPAL POLICE -> used for creation of the database schema and tables
CREATE TABLE public.police_total
(
    year integer,
    ohima_id character varying(15) COLLATE pg_catalog."default" NOT NULL,
    pinakida character varying(25) COLLATE pg_catalog."default",
    klhsh_id character varying(15) COLLATE pg_catalog."default" NOT NULL,
    marka character varying(50) COLLATE pg_catalog."default",
    colour character varying(50) COLLATE pg_catalog."default",
    date date,
    "time" time(6) without time zone,
    street character varying(100) COLLATE pg_catalog."default",
    poso character varying(8) COLLATE pg_catalog."default",
    description_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    eidiki character varying(100) COLLATE pg_catalog."default",
    geniki typosparavasis
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.police_total
    OWNER to vassilis;
	
-- Creation of ENUMERATION Datatype typosparavasis for police_total  table
CREATE TYPE public.typosparavasis AS ENUM
    ('1- ', '2- ');

ALTER TYPE public.typosparavasis
    OWNER TO vassilis;
	
-- table description deleted
-- table ohima
CREATE TABLE public.ohima
(
    ohima_id character varying(15) COLLATE pg_catalog."default" NOT NULL,
    pinakida character varying(25) COLLATE pg_catalog."default",
    marka character varying(50) COLLATE pg_catalog."default",
    colour character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT ohima_pkey PRIMARY KEY (ohima_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.ohima
    OWNER to vassilis;
	
-- import data to ohima table
INSERT INTO public.ohima (ohima_id, pinakida, marka, colour) 
SELECT DISTINCT ohima_id, pinakida, marka, colour FROM public. police_total 
ON CONFLICT (ohima_id)
DO NOTHING;

-- table klhsh
CREATE TABLE public.klhsh
(
    klhsh_id character varying(15) COLLATE pg_catalog."default" NOT NULL,
    geniki typosparavasis,
    poso character varying(8) COLLATE pg_catalog."default",
    year integer,
    "date " date,
    "time" time without time zone,
    street character varying(100) COLLATE pg_catalog."default",
    ohima_id character varying(15) COLLATE pg_catalog."default",
    description_id character varying(10) COLLATE pg_catalog."default",
    eidiki character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT klhsh_pkey PRIMARY KEY (klhsh_id),
    CONSTRAINT klhsh_to_ohima FOREIGN KEY (ohima_id)
        REFERENCES public.ohima (ohima_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.klhsh
    OWNER to vassilis;

CREATE INDEX fki_klhsh_to_ohima
    ON public.klhsh USING btree
    (ohima_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;
	
