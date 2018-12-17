-- WASTE MANAGEMENT DATABASE 
CREATE DATABASE wastemanagement
    WITH 
    OWNER = vassilis
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- sql script for table aporrimmata
CREATE TABLE public.aporimmata
(
    dromologio_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    dimotikienotita character varying(15) COLLATE pg_catalog."default",
    programma character varying(100) COLLATE pg_catalog."default",
    odos character varying(100) COLLATE pg_catalog."default",
    arithmoskadwn smallint,
    katigoriaapor eidos,
    CONSTRAINT aporimmata_pkey PRIMARY KEY (dromologio_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.aporimmata
    OWNER to vassilis;
