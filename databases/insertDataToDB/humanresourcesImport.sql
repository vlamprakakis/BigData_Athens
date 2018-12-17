--import data to tmima table
INSERT INTO public.tmima (tmima_id, titlos) 
SELECT DISTINCT tmima_id, tmima FROM public.giahumanresources

-- import data to dieuthinsi table
INSERT INTO public.dieuthinsi (dieythinsi_id, titlos) 
SELECT DISTINCT dieythinsi_id, dieythinsi FROM public.giahumanresources
ON CONFLICT (dieythinsi_id)
DO NOTHING;

-- import data to ypallilos table
INSERT INTO public.ypallilos (ypallilos_id, "katigoria symvasis", "katigoria ekpaid ", eidikotita, vathmos, fylo, dateofbirth, metaptyxiako,  didaktoriko, ethnikisxoli, dieythinsi_id, tmima_id) 
SELECT DISTINCT ypallilos_id, katigoria_symvasis, katigoria_ekpaid, eidikotita, vathmos, fylo, dateofbirth, metaptyxiako, didaktoriko, ethnikisxoli, dieythinsi_id , tmima_id 
FROM public.giahumanresources 
ON CONFLICT (ypallilos_id)
DO NOTHING;

