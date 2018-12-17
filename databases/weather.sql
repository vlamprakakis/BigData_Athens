--METEOROLOGIKA DEDOMENA DATABASE
CREATE DATABASE weather
    WITH 
    OWNER = vassilis
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- sql script for metrisi kairou table
CREATE TABLE public.metrisikairou
(
    metrisi_id character varying(50) COLLATE pg_catalog."default" NOT NULL,
    year integer,
    month character varying(12) COLLATE pg_catalog."default",
    day smallint,
    meantemp real,
    hightemp real,
    hightemptime time(6) without time zone,
    lowtemp real,
    lowtemptime time(6) without time zone,
    heat_deg_days real,
    cool_deg_days real,
    rain real,
    avg_wind_speed real,
    highwind real,
    highwindtime time without time zone,
    dom_dir character varying(4) COLLATE pg_catalog."default",
    CONSTRAINT metrisikairou_pkey PRIMARY KEY (metrisi_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.metrisikairou
    OWNER to vassilis;
	
	
