-- HUMAN RESOURCES DATABASE	
CREATE DATABASE humanresources
    WITH 
    OWNER = vassilis
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- Creation of ENUMERATION Datatype sxesi_ergasias for HUMAN RESOURCES
CREATE TYPE public.sxesi_ergasias AS ENUM
    ('ΜΟΝΙΜΟΣ', 'ΑΟΡΙΣΤΟΥ ΧΡΟΝΟΥ', 'ΣΥΜΒΑΣΗ ΕΡΓΟΥ', 'ΣΥΜΒΑΣΗ ΧΡΟΝΟΥ');

ALTER TYPE public.sxesi_ergasias
    OWNER TO vassilis;
	
-- Creation of ENUMERATION Datatype ekpaid_vathmida for HUMAN RESOURCES
CREATE TYPE public.ekpaid_vathmida AS ENUM
    ('ΠΕ', 'ΤΕ', 'ΔΕ', 'ΥΕ');

ALTER TYPE public.ekpaid_vathmida
    OWNER TO vassilis;	
	
-- Creation of ENUMERATION Datatype fylo for HUMAN RESOURCES	
CREATE TYPE public.fylo AS ENUM
    ('ΑΝΔΡΑΣ', 'ΓΥΝΑΙΚΑ');

ALTER TYPE public.fylo
    OWNER TO vassilis;	
	
-- table with total data of HUMAN RESOURCES -> to be divided into 3 tables according to database schema
CREATE TABLE public.giahumanresources
(
    ypallilos_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    eidikotita character varying(100) COLLATE pg_catalog."default",
    vathmos character varying(50) COLLATE pg_catalog."default",
    dieythinsi_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    dieythinsi character varying(200) COLLATE pg_catalog."default",
    tmima_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    tmima character varying(200) COLLATE pg_catalog."default",
    dateofbirth date,
    metaptyxiako character varying(50) COLLATE pg_catalog."default",
    didaktoriko character varying(50) COLLATE pg_catalog."default",
    ethnikisxoli character varying(50) COLLATE pg_catalog."default",
    katigoria_symvasis sxesi_ergasias,
    fylo fylo,
    katigoria_ekpaid ekpaid_vathmida
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.giahumanresources
    OWNER to vassilis;

-- table tmima
CREATE TABLE public.tmima
(
    tmima_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    titlos character varying(200) COLLATE pg_catalog."default",
    CONSTRAINT tmima_pkey PRIMARY KEY (tmima_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.tmima
    OWNER to vassilis;
	

-- table dieuthinsi
CREATE TABLE public.dieuthinsi
(
    dieythinsi_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    titlos character varying(200) COLLATE pg_catalog."default",
    CONSTRAINT dieuthinsi_pkey PRIMARY KEY (dieythinsi_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.dieuthinsi
    OWNER to vassilis;
	
	
-- table ypallilos
CREATE TABLE public.ypallilos
(
    ypallilos_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "katigoria symvasis" sxesi_ergasias,
    "katigoria ekpaid " ekpaid_vathmida,
    eidikotita character varying(100) COLLATE pg_catalog."default",
    vathmos character varying(50) COLLATE pg_catalog."default",
    fylo fylo,
    dateofbirth date,
    metaptyxiako character varying(50) COLLATE pg_catalog."default",
    didaktoriko character varying(50) COLLATE pg_catalog."default",
    ethnikisxoli character varying(50) COLLATE pg_catalog."default",
    dieythinsi_id character varying(10) COLLATE pg_catalog."default",
    tmima_id character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT ypallilos_pkey PRIMARY KEY (ypallilos_id),
    CONSTRAINT ypallilos_to_dieuthinsi FOREIGN KEY (dieythinsi_id)
        REFERENCES public.dieuthinsi (dieythinsi_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ypallilos_to_tmima FOREIGN KEY (tmima_id)
        REFERENCES public.tmima (tmima_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.ypallilos
    OWNER to vassilis;

CREATE INDEX fki_ypallilos_to_dieuthinsi
    ON public.ypallilos USING btree
    (dieythinsi_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE INDEX fki_ypallilos_to_tmima
    ON public.ypallilos USING btree
    (tmima_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;	
	
