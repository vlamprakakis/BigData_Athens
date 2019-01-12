-- import data to katigoria table
INSERT INTO public.katigorias (katigoria_id, katigoria) 
SELECT DISTINCT  katigoria_id, katigoria FROM public. giagymnastic 
ON CONFLICT (katigoria_id)
DO NOTHING;

-- import data to use table
INSERT INTO public.use (use_id, katigoria_id, ilikiakiomada, fylo, dimotisathinas, hwros, programma, checkin, checkout) 
SELECT DISTINCT use_id,  katigoria_id, ilikiakiomada, fylo, dimotisathinas, hwros, programma, checkin, checkout 
FROM public. giagymnastic 
ON CONFLICT (use_id)
DO NOTHING;

