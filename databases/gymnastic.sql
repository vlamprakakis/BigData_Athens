-- GYMNASTIC VENUES DATABASE
CREATE DATABASE gymnastic
    WITH 
    OWNER = vassilis
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- table with total data for database (GYMNASTIC VENUES) to be created
CREATE TABLE public.giagymnastic
(
    use_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    katigoria_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    katigoria character varying(100) COLLATE pg_catalog."default",
    ilikiakiomada character varying(50) COLLATE pg_catalog."default",
    hwros character varying(50) COLLATE pg_catalog."default",
    programma character varying(100) COLLATE pg_catalog."default",
    checkin timestamp(6) without time zone,
    checkout timestamp(6) without time zone,
    fylo fylo,
    dimotisathinas dimotis
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.giagymnastic
    OWNER to vassilis;
	
-- table people (GYMNASTIC VENUES)
CREATE TABLE public.people
(
    people_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    fylo fylo,
    dimotisathinas dimotis,
    katigoria_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    ilikiakiomada character varying(50) COLLATE pg_catalog."default",
    dateofbirth date,
    periohi character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT people_pkey PRIMARY KEY (people_id),
    CONSTRAINT people_to_katigorias FOREIGN KEY (katigoria_id)
        REFERENCES public.katigorias (katigoria_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.people
    OWNER to vassilis;

CREATE INDEX fki_people_to_katigoria
    ON public.people USING btree
    (katigoria_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;
		
-- table katigoria	
CREATE TABLE public.katigorias
(
    katigoria_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    katigoria character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT katigorias_pkey PRIMARY KEY (katigoria_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.katigorias
    OWNER to vassilis;	

-- import data to katigoria table
INSERT INTO public.katigorias (katigoria_id, katigoria) 
SELECT DISTINCT  katigoria_id, katigoria FROM public. giagymnastic 
ON CONFLICT (katigoria_id)
DO NOTHING;

-- table use
CREATE TABLE public.use
(
    use_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    katigoria_id character varying(10) COLLATE pg_catalog."default",
    ilikiakiomada character varying(50) COLLATE pg_catalog."default",
    fylo fylo,
    dimotisathinas dimotis,
    hwros character varying(50) COLLATE pg_catalog."default",
    programma character varying(100) COLLATE pg_catalog."default",
    checkin timestamp(6) without time zone,
    checkout timestamp(6) without time zone,
    CONSTRAINT use_pkey PRIMARY KEY (use_id),
    CONSTRAINT use_to_katigoria FOREIGN KEY (katigoria_id)
        REFERENCES public.katigorias (katigoria_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.use
    OWNER to vassilis;

CREATE INDEX fki_use_to_katigoria
    ON public.use USING btree
    (katigoria_id COLLATE pg_catalog."default")
    TABLESPACE pg_default;

-- import data to use table
INSERT INTO public.use (use_id, katigoria_id, ilikiakiomada, fylo, dimotisathinas, hwros, programma, checkin, checkout) 
SELECT DISTINCT use_id,  katigoria_id, ilikiakiomada, fylo, dimotisathinas, hwros, programma, checkin, checkout 
FROM public. giagymnastic 
ON CONFLICT (use_id)
DO NOTHING;

