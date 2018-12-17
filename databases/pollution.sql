	
-- ATMOSFAIRIKI RYPANSI DATABASE
CREATE DATABASE pollution
    WITH 
    OWNER = vassilis
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- sql script for atmosfairiki rypansi table	
CREATE TABLE public.atmosfrypansi
(
    rypos_id character varying(50) COLLATE pg_catalog."default" NOT NULL,
    ryposperigrafi character varying(10) COLLATE pg_catalog."default",
    periohi character varying(20) COLLATE pg_catalog."default",
    gmikos character varying(20) COLLATE pg_catalog."default",
    gplatos character varying(20) COLLATE pg_catalog."default",
    metrisidate date,
    value_06_12_18 character varying(25) COLLATE pg_catalog."default",
    CONSTRAINT atmosfrypansi_pkey PRIMARY KEY (rypos_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.atmosfrypansi
    OWNER to vassilis;
