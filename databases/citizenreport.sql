-- URBAN CITIZENREPORT DATABASE
CREATE DATABASE citizenreport
    WITH 
    OWNER = vassilis
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- Total data table creation for CITIZENREPORT -> used for creation of the database schema and tables	
CREATE TABLE public.totalcitizendata
(
    aitima_id character varying(15) COLLATE pg_catalog."default" NOT NULL,
    aitimadate date,
    aitimaperigrafi text COLLATE pg_catalog."default",
    dimotikienotita character varying(50) COLLATE pg_catalog."default",
    aitimakatigoria character varying(200) COLLATE pg_catalog."default",
    ypiresia_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    titlosypiresias character varying(200) COLLATE pg_catalog."default",
    periohistreet character varying(100) COLLATE pg_catalog."default",
    periohistreetnum character varying(30) COLLATE pg_catalog."default",
    periohi_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    periohiperigrafi character varying(100) COLLATE pg_catalog."default",
    aitimaproodos katastasiaitimatos
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.totalcitizendata
    OWNER to vassilis;
	
-- Creation of ENUMERATION Datatype katastasiaitimatos for totalcitizendata table
CREATE TYPE public.katastasiaitimatos AS ENUM
    ('Ολοκληρωμένο', 'Σε Εξέλιξη');

ALTER TYPE public.katastasiaitimatos
    OWNER TO vassilis;	
	
--table periohi  
CREATE TABLE public.periohi
(
    periohi_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    periohiperigrafi character varying(100) COLLATE pg_catalog."default",
    dimotikienotita character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT periohi_pkey PRIMARY KEY (periohi_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.periohi
    OWNER to vassilis;
	

-- ypiresia table 
CREATE TABLE public.ypiresia
(
    ypiresia_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    titlosypiresias character varying(200) COLLATE pg_catalog."default",
    CONSTRAINT ypiresia_pkey PRIMARY KEY (ypiresia_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.ypiresia
    OWNER to vassilis;
	
-- aitima table 
CREATE TABLE public.aitima
(
    aitima_id character varying(15) COLLATE pg_catalog."default" NOT NULL,
    aitimadate date,
    aitimaproodos katastasiaitimatos,
    aitimakatigoria character varying(200) COLLATE pg_catalog."default",
    aitimaperigrafi text COLLATE pg_catalog."default",
    periohistreet character varying(100) COLLATE pg_catalog."default",
    periohisreetnum character varying(30) COLLATE pg_catalog."default",
    ypiresia_id character varying(10) COLLATE pg_catalog."default",
    periohi_id character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT aitima_pkey PRIMARY KEY (aitima_id),
    CONSTRAINT perioxi_to_aitima FOREIGN KEY (periohi_id)
        REFERENCES public.periohi (periohi_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ypiresia_to_aitima FOREIGN KEY (ypiresia_id)
        REFERENCES public.ypiresia (ypiresia_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.aitima
    OWNER to vassilis;

CREATE INDEX fki_perioxi_to_aitima
    ON public.aitima USING btree
    (periohi_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE INDEX fki_ypiresia_to_aitima
    ON public.aitima USING btree
    (ypiresia_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;
	
