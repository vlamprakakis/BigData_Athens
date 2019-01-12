-- import data to ohima table
INSERT INTO public.ohima (ohima_id, pinakida, marka, colour) 
SELECT DISTINCT ohima_id, pinakida, marka, colour FROM public. police_total 
ON CONFLICT (ohima_id)
DO NOTHING;

-- 	import data to klhsh table
INSERT INTO public.klhsh (klhsh_id, geniki, poso, year, "date ", "time", street, ohima_id, description_id, eidiki) 
SELECT DISTINCT klhsh_id, geniki, poso, year, date, "time", street, ohima_id, description_id, eidiki 
FROM public.police_total 
ON CONFLICT (klhsh_id)
DO NOTHING;
