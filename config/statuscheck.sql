
select 
to_char(to_timestamp(updated),'YYYY/MM/DD HH24:MI') as time_group,
count(1) as num
from public.sta_responses
group by time_group
order by time_group desc

select count(1) from public.sta_responses;
select count(1) from public.sta_queue;


select 
to_char(to_timestamp(created),'YYYY/MM') as time_group,
count(distinct by) as num_distinct_posters,
count(1) as num
from public.sta_responses
group by time_group
order by time_group desc


