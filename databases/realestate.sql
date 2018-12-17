-- REALESTATE DATABASE
CREATE DATABASE realestate
    WITH 
    OWNER = vassilis
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- table akinito kai arithmos idioktision 
	
CREATE TABLE public.akinito
(
    akinito_id character varying(50) COLLATE pg_catalog."default" NOT NULL,
    odos character varying(100) COLLATE pg_catalog."default",
    arithmos character varying(10) COLLATE pg_catalog."default",
    akinitotypos katigoriaakinitou,
    sxediopolis poleodomiko,
    arithmosidioktision smallint,
    CONSTRAINT akinito_pkey PRIMARY KEY (akinito_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.akinito
    OWNER to vassilis;
	
--  table timizonis ana odo
	
CREATE TABLE public.timizonis
(
    timi_id character varying(50) COLLATE pg_catalog."default" NOT NULL,
    year integer,
    odos character varying(100) COLLATE pg_catalog."default",
    apoper smallint,
    eosper smallint,
    apoart smallint,
    eosart smallint,
    dimotikienotita smallint,
    zoni_id integer NOT NULL,
    timizoni character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT timizonis_pkey PRIMARY KEY (timi_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.timizonis
    OWNER to vassilis;
