-- import data to periohi table. From totalcitizendata table
INSERT INTO public.periohi (periohi_id, periohiperigrafi, dimotikienotita) 
SELECT DISTINCT periohi_id, periohiperigrafi, dimotikienotita FROM public.totalcitizendata 
ON CONFLICT (periohi_id)
DO NOTHING;

-- import data to ypiresia table. From totalcitizendata table	
INSERT INTO public.ypiresia (ypiresia_id, titlosypiresias) 
SELECT DISTINCT ypiresia_id, titlosypiresias FROM public.totalcitizendata 

-- Import data to aitima table. From totalcitizendata table
INSERT INTO public.aitima (aitima_id, aitimadate, aitimaproodos, aitimakatigoria, aitimaperigrafi, periohistreet, periohisreetnum, ypiresia_id,  periohi_id) 
SELECT DISTINCT aitima_id, aitimadate, aitimaproodos, aitimakatigoria, aitimaperigrafi, periohistreet, periohisreetnum, ypiresia_id,  periohi_id  
FROM public.totalcitizendata 
ON CONFLICT (aitima_id)
DO NOTHING;
